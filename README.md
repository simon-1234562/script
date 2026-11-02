# Tensen GPO local recovery

Use the complete Tensen-GPO-local.luau file, or the public loader in loader.luau. Start in a fresh Roblox session after updating: an already-loaded hub cannot reliably be replaced in place. Right Shift toggles the UI. The UI is bundled locally.

## Sandora test build

Added from user-supplied screenshots: Noah, the dialogue choices 'How can I help?' and 'Alright!', and the active 'Defeat Desert Bandits' quest requiring seven Desert Bandits.

For First Sea characters below level 190, Auto Farm now uses the Sandora adapter. Start beside Noah on Sandora. If the Desert Bandits quest is already active, the adapter seeks a nearby living Desert Bandit and uses the existing combat/movement helpers. Otherwise it approaches a nearby Noah, opens his prompt (or the displayed T interaction), clicks the observed dialogue choices, and waits for the active quest to appear before combat. It repeats after the quest disappears. It does not guess the game's internal quest identifier.

The active quest is detected using the recovery's existing PlayerGui.Quest.Main hierarchy. Visible NPC names may differ from internal names. Those assumptions require an in-game test. If automatic dialogue fails, accept the quest manually and enable Auto Farm. Pick Melee if using a fighting style, or Sword if using a sword.

Stops report a console warning, notification and status text. Missing Noah or another active quest produces an explanation rather than initiating Fishman travel. Dialogue confirmation has a 25-second timeout. Normal completion, stopping Auto Farm and missing enemy spawns clear the Sandora combat target.

This adds Sandora only. It does not implement a complete level-based route through all First Sea islands. At level 190 the existing recovered Fishman branch applies; Second Sea uses its recovered wolves branch. The Fishman branch still requires in-game validation and contains approximated route data.

## Cleanup and retained features

All 153 original literal feature flag declarations and original credits are retained. The initial anti-tamper module, destructive file purges, clipboard clearing, debug/write interception and punishment were removed. The bundled UI's network presence backend, HTTP interception and remote administration/kick mechanism were removed. Normal configuration management and the optional user-configured fruit webhook remain. The webhook defaults to off.

Other recovery gaps remain, including the empty flowerPrompt function, an incomplete Big Mom chase callback and approximated/missing parts of fruit recording, navigation and timing. Preserving a control does not establish that its feature works. The executor executable has not been audited.

## Validation

Official Luau 0.745 compiles the entire updated script successfully. Isolated tests execute the actual Sandora adapter with simulated world/UI objects: active quest and target selection, no-spawn wait, completed quest, unrelated quest rejection, Noah interaction, both dialogue choices, dialogue timeout and stopping/reset. All pass. No GPO gameplay was executed for validation. User testing remains necessary.

Bundled build SHA-256: 53120cd5b96bd87e06b6e33493920f5be93a89fad8cb881109c480394037276b
Original UI source: https://raw.githubusercontent.com/LeviOnTopLOL/Halloween/refs/heads/main/oxideui.lua
Original hub input: user-provided tesenrecover.txt.
