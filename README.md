# Tensen GPO local recovery

Use Tensen-GPO-local.luau. It contains the edited UI; oxideui-local.luau is a reference copy and does not need to run separately.

Start in a fresh Roblox session. Open the main file as text and use its complete contents in your executor. Toggle the UI with Right Shift. If the original ran previously, restart Roblox first: its existing hooks and background tasks cannot reliably be undone.

## Changes

- Preserved all 153 literal feature flag declarations in tesenrecover.txt, in order, and its recovered gameplay code and original credits.
- Removed the initial anti-tamper module: tool detection, punishment, clipboard clearing, executor interference, dump deletion, file-write interception, and recurring file purges.
- Bundled a local UI snapshot instead of executing the changing GitHub download.
- Removed the UI presence backend, HTTP hook, registration, network tags, and remote administration/kick mechanism. These are intentionally excluded from the preserved features.
- Replaced a deliberate error in the orb diagnostic with a color display.
- Kept normal config management, including explicit config deletion, and the optional user-configured fruit webhook. The webhook defaults to off in a fresh environment.

## Known limits

This is a cleaned recovery build, not a verified fully working GPO release. The supplied code is incomplete:

- flowerPrompt has an empty body.
- A Big Mom chase branch explicitly throws 'attempt to call a number value' / 'attempt to compare nil < number'. That callback also ends without implementing the movement described by its comments.
- Parts of fruit recording, configuration refresh, navigation routes, and timing data are described as missing or approximated in the source.
- The earlier tensenpoop.txt also contains broken/dead branches and does not supply verified implementations of the missing routines.

These gameplay gaps remain. Preserving a toggle does not prove the feature works. Features may fail, remain inactive, or require repairs against the current GPO structure. All currently recovered feature code is included; missing original code cannot be faithfully recovered from these files alone.

Both output Lua files compile with official Luau 0.745. Compilation checks syntax and compiler limits, not Roblox API behavior or gameplay. No executor or GPO session was used. This does not audit the executor executable or establish that execution is safe.

## Provenance

Hub source: user-provided tesenrecover.txt. Original credits retained.
Source SHA-256 (UTF-8 text normalized to LF): c245b52b3e672d47ca28761577827acb37fbd92988be6136fdca536271f3ad6c
UI source: https://raw.githubusercontent.com/LeviOnTopLOL/Halloween/refs/heads/main/oxideui.lua
UI retrieval date: November 2, 2026.
Downloaded UI SHA-256: ec6aa1dd775c0b6d755bb230e7ee0ec30b0b9319bd0548d7106bc627e35fa87a
Bundled build SHA-256: ff611f1f4bce449e709c59c9546bce7a610c2516f23bf1ba83469e4f4e67af54

See VALIDATION.txt for checks.

## First Sea autofarm correction

The First Sea recovery has only a Fishman quest branch; its existing quest condition requires level 190. It has no Sandora or other early-level quest selection despite the original UI description. Auto Farm now stops below that threshold with an explanation instead of attempting Fishman travel. This does not add low-level farming. Fishman arrival waits reacquire streamed instances, verify proximity and stop with a visible reason on timeout. Toggle state follows the stop. Functional GPO testing is still required.
