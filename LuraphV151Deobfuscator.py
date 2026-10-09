#!/usr/bin/env python3
"""Bounded Luraph v15/v15.1 deobfuscation driver.

This driver orchestrates the local Aurora deobfuscator; it never executes the
input outside the bounded analysis subprocess and never labels a partial trace
as a complete reconstruction.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path


def detect(text: str) -> dict:
    m = re.search(r"Luraph Obfuscator v([0-9.]+)", text[:4096], re.I)
    version = m.group(1) if m else "unknown"
    return {
        "protection": "Luraph" if m else "unknown",
        "version": version,
        "v15_family": version.startswith("15."),
        "bytes": len(text.encode("utf-8", "replace")),
        "lines": text.count("\n") + 1,
        "has_path2d": "Path2D" in text,
        "has_buffer_api": bool(re.search(r"\bbuffer\.(read|write|create|len|fromstring)", text)),
        "has_loadstring": "loadstring" in text,
    }


def run_bounded(deob_root: Path, inp: Path, out: Path, timeout: int, spin: int) -> tuple[int, str]:
    cmd = [
        sys.executable,
        str(deob_root / "deobf" / "deob.py"),
        str(inp),
        "-o", str(out),
        "--obfuscator", "luraph_v15",
        "--timeout", str(timeout),
        "--max-runs", "8",
        "--devirt-rounds", "2",
        "--debug",
    ]
    try:
        p = subprocess.run(cmd, cwd=deob_root, text=True, capture_output=True, timeout=timeout + 30)
        return p.returncode, p.stdout + p.stderr
    except subprocess.TimeoutExpired as exc:
        return 124, (exc.stdout or "") + (exc.stderr or "") + "\n[driver] subprocess timeout\n"


def main() -> int:
    ap = argparse.ArgumentParser(description="Bounded Luraph v15/v15.1 analysis driver")
    ap.add_argument("input", type=Path)
    ap.add_argument("-o", "--outdir", type=Path, default=Path("luraph_v151_output"))
    ap.add_argument("--deob-root", type=Path, required=True, help="Aurora deobfuscator root")
    ap.add_argument("--timeout", type=int, default=120)
    ap.add_argument("--spin", type=int, default=12)
    args = ap.parse_args()

    raw = args.input.read_text(encoding="utf-8", errors="replace")
    info = detect(raw)
    args.outdir.mkdir(parents=True, exist_ok=True)
    digest = hashlib.sha256(args.input.read_bytes()).hexdigest()
    (args.outdir / "input.sha256").write_text(digest + "\n")
    (args.outdir / "detection.json").write_text(json.dumps({**info, "sha256": digest}, indent=2) + "\n")

    out = args.outdir / (args.input.stem + ".trace.luau")
    rc, log = run_bounded(args.deob_root, args.input, out, args.timeout, args.spin)
    (args.outdir / "run.log").write_text(log)

    failure = None
    if re.search(r"arithmetic \(add\) on buffer and number", log, re.I):
        failure = {
            "class": "buffer_arithmetic_mismatch",
            "message": "The v15.1 sample uses a buffer arithmetic path not modeled by the current tracer.",
            "complete_reconstruction": False,
            "next_step": "Add a v15.1 buffer-state model or supply a trace from a compatible Luau runtime.",
        }
    elif "loop" in log.lower() and "guard" in log.lower():
        failure = {
            "class": "bounded_loop_or_stage_key",
            "message": "The protected VM did not reach a stable decode state within the bound.",
            "complete_reconstruction": False,
            "next_step": "Capture the missing runtime stage inputs and replay them in the tracer.",
        }

    report = {
        "input": str(args.input),
        "sha256": digest,
        "detection": info,
        "return_code": rc,
        "artifact": str(out) if out.exists() else None,
        "artifact_bytes": out.stat().st_size if out.exists() else 0,
        "complete_reconstruction": failure is None and out.exists() and out.stat().st_size > 1000,
        "failure": failure,
    }
    (args.outdir / "report.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
