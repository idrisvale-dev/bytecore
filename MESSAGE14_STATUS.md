# message(14) static status

- Detected protection: Luraph v14.8
- Static trace: completed
- Bounded spin pass: 180 seconds
- AST parse: passed
- Luau compile: passed
- Result: trace shell only; the dynamic payload was not recovered by the available offline pass

The trace records the embedded loadstring metadata and the observed `CoreGui` access, but it does not contain the full decoded UI/library. This artifact is not presented as a complete crack.
