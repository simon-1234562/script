# Tensen GPO recovery: Sandora test rolled back

The Sandora adapter was removed after the user reported Roblox crashes. The cause is not yet established. Do not treat compilation or isolated tests as proof that this runs safely in GPO or with a particular executor.

The public loader currently serves the earlier guarded recovery. Below level 190 in First Sea, Auto Farm stops with an explanation instead of starting the recovered Fishman route. Sandora farming is not available in this version. Recovered higher-level features remain incomplete and unverified in-game.

The rollback preserves the earlier cleanup: destructive anti-tamper code removed, UI bundled locally, UI registration and remote admin kick system removed, and the Fishman arrival wait bounded. All 153 original literal feature flag declarations and original credits remain. Right Shift toggles the UI.

Crash diagnosis needs the trigger: loader execution, enabling Auto Farm, movement, or combat; and whether Roblox closes, freezes, or shows an error/disconnect message. Repeated execution in one session can leave old background loops running. Do not repeatedly rerun the crashing test build.

Validation: the rollback compiles with official Luau 0.745. It is the same guarded version that preceded the Sandora adapter, not a demonstrated crash fix. No GPO functional test has been performed by the assistant.

Original hub input: user-provided tesenrecover.txt.
Original UI source: https://raw.githubusercontent.com/LeviOnTopLOL/Halloween/refs/heads/main/oxideui.lua
