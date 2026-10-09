# Luraph v15/v15.1 Deobfuscator Driver

`LuraphV151Deobfuscator.py` is a bounded analysis driver for the local Aurora deobfuscation backend. It detects the Luraph version, runs the v15 trace/devirtualization backend with explicit limits, collects logs/artifacts, and writes a JSON report.

It is intentionally honest about incomplete results: a dynamic trace or a VM-stage failure is never presented as a fully reconstructed script.

## Usage

```bash
python3 LuraphV151Deobfuscator.py \
  /path/to/input.luau \
  --deob-root /path/to/AURORA_DEOB_SYSTEM \
  --outdir ./luraph_v151_output
```

Outputs:

- `detection.json` — version, size, buffer/Path2D/loadstring markers, and SHA-256
- `run.log` — bounded backend diagnostics
- `*.trace.luau` — trace artifact if the backend emitted one
- `report.json` — completion status and a classified failure reason

## Current v15.1 limitation

The supplied `Kaitun-Leviathan.luau` sample is detected as **Luraph v15.1**. The current backend reaches the protected VM but stops at:

```text
attempt to perform arithmetic (add) on buffer and number
```

That is a **buffer-state emulation gap**, not a successful deobfuscation. The next implementation step is a v15.1 buffer-state model in the interpreter, followed by regression tests against the sample and a known-good v15 fixture.
