# Tensen GPO: Auto Quest (Sandora)

Start in a fresh Roblox session and run loader.luau. Start beside Noah on Sandora, or with his Desert Bandits quest active. Keep Auto Farm (Recovered Routes) off. Use your working Tween To NPC / selected Desert Bandit and M1/weapon settings, then enable Auto Quest (Sandora) in the Auto Farm tab.

While the Desert Bandits quest is active, Auto Quest leaves your existing combat settings in control. When no quest is active, it pauses NPC chasing and the shared M1 loops, returns to a nearby Noah, opens his dialogue, and clicks 'How can I help?' then 'Alright!'. Confirming the quest releases the lock and resumes the existing NPC movement/combat.

The new toggle starts off each session and is not saved in configs. No controller loop or scan starts before manual enabling. Only the NPC container is searched for Noah; the controller never enumerates the whole world. Selected NPC, weapon and Tween To NPC settings are preserved. Other automatic travel modes must be off.

Supports only Noah's Sandora Desert Bandits quest. Other active quests, missing Noah, travel failure and dialogue failure produce an explanatory stop. It uses the recovery's PlayerGui.Quest.Main hierarchy, which still needs in-game confirmation. If dialogue fails, accept the quest manually and enable Auto Quest again. Right Shift toggles the hub unless a saved keybind overrides it.

## Validation and limits

Full build compiles with official Luau 0.745. Isolated tests using the actual controller pass for idle startup, preserving NPC settings, movement lock/release, Noah prompt, both dialogue choices, conflicting quest, missing NPC, travel/dialogue timeouts and disabling cleanup. No GPO execution was used for these tests. The user has confirmed existing NPC tweening/M1 work and the rolled-back hub can remain open. The new quest controller still needs in-game testing.

The earlier combined Sandora farm adapter remains rolled back after reported crashes. The compile-only diagnostic passed; the intermittent startup shutdown cause is unconfirmed. Separate diagnose.luau and diagnose-ui.luau tools remain available.

All 153 original feature flags and original credits remain. Recovered higher-level routes and other gameplay still contain missing/approximated code. The destructive initial anti-tamper and UI presence/admin kick/HTTP interception were removed. Normal config management and the optional user-configured fruit webhook remain. The executor executable has not been audited.

Original input: user-provided tesenrecover.txt.
UI source: https://raw.githubusercontent.com/LeviOnTopLOL/Halloween/refs/heads/main/oxideui.lua
Build SHA-256: 4fbdac62f5f40e21926b205b3869833e60f2449c1c2aee1da4c6992f2051cfb5
