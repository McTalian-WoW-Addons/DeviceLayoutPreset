# DeviceLayoutPreset conventions

## Structure

- Single-file addon: `DeviceLayoutPreset/Core.lua` holds the AceAddon object, AceConfig
  options table, and all event handlers; start it `local addonName, ns = ...` then
  `local G_DLP = ns`.
- Built on Ace3 (`AceAddon-3.0`, `AceConsole-3.0`, `AceEvent-3.0`, `AceTimer-3.0`,
  `AceHook-3.0`, `AceBucket-3.0`, `AceDB-3.0`, `AceConfig-3.0`, `AceLocale-3.0`);
  externals resolved via `.pkgmeta`/`embeds.xml`, not vendored in-repo.
- Persisted state lives in `DLP.db` (`AceDB-3.0` on `DeviceLayoutPresetDB`); never read
  `DLP.db` before `OnInitialize` has run.

## WoW API

- Edit Mode layout access goes through `EditModeManagerFrame:GetLayouts()` /
  `:SelectLayout()` and `C_EditMode` hooks (`OnLayoutDeleted`, `OnLayoutAdded`), hooked
  with `self:SecureHook(C_EditMode, ...)`.
- Spec lookups guard the 11.2.0 deprecation of `GetSpecializationInfo`: prefer
  `C_SpecializationInfo.GetSpecializationInfo` when present, fall back otherwise.
- Confirm API signatures/events per flavor with `/wow-dev:wow-api`
  (`~/code/wow-ui-source`); this addon currently ships Retail only
  (`## Interface: 120100`).

## Strings

- All user-facing text goes through `G_DLP.L["KEY"]`, sourced from
  `DeviceLayoutPreset/locale/enUS.lua` via `AceLocale-3.0`.
- New keys are added under the current `--#region <version range>` block in
  `enUS.lua`; other locale files (`deDE.lua`, `esES.lua`, etc.) pick up matching
  commented-out entries via the i18n tooling.
- Run `make i18n_check` before committing new/changed keys; `make i18n_fmt` to
  reorganize locale files.

## Testing

- No spec suite (`has.tests` = false); `make test-ci` is a no-op stub kept only so CI's
  coverage step doesn't fail.
- Verify changes with `make boot_sim`, which builds the addon and boots a simulated
  client login to catch Lua load errors before a player would hit them.

## Packaging

- Only `DeviceLayoutPreset/` ships; root-level `Makefile`, `.github/`, `*.rockspec`,
  `*.code-workspace` are dev-only.
- `git add` new files before `make dev`/`make build`/`make boot_sim` — untracked files
  are silently skipped by `wow-build-tools`.
- Type commits by whether they touch the packaged `DeviceLayoutPreset/` dir; see
  `/wow-dev:git-workflow`.
