# PVPScript.luau — sandbox HTTP/HTTPS log

## Execution

- Source: `https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/PVPScript.luau`
- Protector: **Luraph v15.0**
- Source size: **333,196 bytes**
- Source SHA-256: `88cd2082260741745a040c0816c100b66fda8b6a89de02144d8a075398918902`
- Logger mode: local `envlog`/Aurora harness with HTTP calls stubbed and recorded
- Outbound target requests: **disabled**
- Path2D answers: 13 offline-model answers
- Run status: finished

## Observed request

| Method | URL | Result |
|---|---|---|
| `game:HttpGet` | `https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/Ui-Library/V2Loader.luau` | Stubbed during trace |

The recovered trace then executes:

```lua
local response = game:HttpGet("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/Ui-Library/V2Loader.luau")
loadstring(response)()
```

## Second-stage check

A separate non-executing fetch of the exact URL returned:

```text
HTTP 404 Not Found
```

Therefore the second-stage loader could not be replayed, and no additional dynamically loaded HTTP/HTTPS endpoints could be observed from that dependency in this run.

## Static markers

The outer protected layer contained no literal endpoint other than the Luraph attribution URL. The URL above was reconstructed dynamically by the v15 tracer.

Observed related operations:

- `loadstring`
- `game:HttpGet`
- `gethui`
- `Drawing.new("Circle")`
- `Drawing.new("Line")`
- `RaycastParams.new()`
- `getgenv().gethui = nil`

No `request`, `syn.request`, `http_request`, `HttpPost`, `PostAsync`, `RequestAsync`, webhook, `writefile`, or `readfile` call was observed in the reachable outer trace.

## Artifacts

- `PVPScript_trace.luau` — 86-statement dynamic trace
- `PVPScript_trace.strings.txt` — decoded strings
- `raw_runtime.log` — raw sandbox logger output
- `PVPScript_trace.protos.json` — decoded prototype data

This is a bounded, observed-path result. It does not prove that unreachable branches or a restored second-stage loader contain no additional network calls.
