# DeviceLayoutPreset

An addon for World of Warcraft to make playing on different devices a little easier.

## Commands

`make help` lists targets. Checks: `/wow-dev:run-checks` (runs `make i18n_check` +
trunk). Only via make: `make dev`, `make boot_sim` (catches Lua load errors
pre-release), `make i18n_check`, `make i18n_fmt`.
No `./trunk` launcher checked in here (unlike sibling repos) — use the global
`trunk fmt` / `trunk check` binary; config is `.trunk/trunk.yaml`.
No test suite (`make test-ci` is a no-op stub for CI).

## Conventions

- User-facing text via `G_DLP.L["KEY"]`; add the key to `DeviceLayoutPreset/locale/enUS.lua`
  under the current `--#region <version>` block.
- Single addon file (`Core.lua`); `local addonName, ns = ...` then `local G_DLP = ns`.
- No specs/mocks; correctness is checked by `make boot_sim` and manual in-game testing.

Full list: `docs/agent/conventions.md`.

## Docs

No `docs/**.md` or `.github/docs/**.md` files yet.
