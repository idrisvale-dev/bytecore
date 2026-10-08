# Quantum Onyx + NightHub

This revision replaces the legacy Quantum UI backend with a compatibility adapter backed by the pinned NightHub reconstructed library.

## Static validation

- AST parse: passed
- Luau compile: passed
- Source remains unexecuted in the sandbox
- Legacy `dev/testers.lua` UI load removed
- Hidden `WeeboDevAurora.lua` loader removed

## Adapter mapping

- `AddTab` / `addSection` / `addMenu`
- `addToggle` -> NightHub `AddToggle`
- `addDropdown` -> NightHub `AddDropdown`
- `addSlider` -> NightHub `AddSlider`
- `addTextbox` -> NightHub `AddTextbox`
- `addButton` / `addButtonGrid` -> NightHub `AddButton`
- `addParagraph` -> NightHub `AddParagraph`

## Important runtime dependencies

The original feature logic still contains Blox Fruits remotes, executor-only hooks, webhook/data-log code, and remote module downloads. Those behaviors were not executed or silently rewritten during this static integration.
