# yanus hub: quest selector

Rejoin and run the normal loader from loader.luau. Keep Auto Load off while testing. In the Auto Farm tab, choose Quest, then enable Auto Farm. The new controls are not saved in configs and start off each session.

## Quest choices

- Sandora - Desert Bandits (Noah): repeats Noah's quest automatically. Minimum level 10; no upper-level limit. Level 20 and higher can continue this quest. Selects Desert Bandit and uses the existing NPC/M1 settings.
- Use current quest (accept manually): accept a kill quest in game, then enable Auto Farm. It matches the target NPC from Quest/Main/Info/Top/Progress, including simple plural names such as Marine(s). Available in First and Second Sea. NPCs must be loaded nearby. When the quest ends, movement and M1 pause while you manually accept another quest; then it resumes. Automatic acceptance/renewal for these other quests is not implemented.

If matching fails, enter the exact internal NPC name in Quest enemy (optional). This overrides automatic enemy matching in current-quest mode. Changing the mode or override stops the running farm. Delivery and collection quests are not supported by NPC combat farming.

Stopping Auto Farm or Tween To NPC stops the NPC driver and releases its holding forces. STOP NPC MOVEMENT is also available. release-movement.luau is a separate recovery for an old stuck session. Repeated identical failure notifications are suppressed for 15 seconds; the status remains visible.

Recovered Quest Routes (Advanced) and the other original farming features remain. Keep conflicting farm/travel modes off when using the main Auto Farm control. Full simplified navigation and removal of unrelated PvP/trade controls remain pending. See REMOVALS.md for the existing cleanup inventory.

## Validation and limits

Full build compiles with official Luau 0.745. Isolated tests of the actual controller cover levels 9, 14, 20 and 500; current quest target matching; manual renewal pause/resume; mode switching; missing helpers; hidden quest panels; notification suppression; timeout and stop behavior. Tests of actual movement cleanup and toggle hit areas pass. All 153 original literal feature flags remain. No GPO execution was used for validation, so in-game quest acceptance and completion still require user testing.

Noah, Desert Bandit, the active quest title/progress paths and Dialogue root were confirmed by supplied live diagnostic reports. Other automatic quest dialogue routes are not implemented. Original attribution remains in source. Destructive anti-tamper, UI presence/admin reporting, the loading splash and music player were removed. Executor-based automation has no ban-free guarantee.

## Noah approach correction

Quest-giver travel no longer supplies BossKey=NPC. That key allowed NPCOffsetY and NPCShuffle to override the intended quest interaction point. The target now lies up to three studs in front of Noah using his facing direction, at his root height. Quest travel disables combat shuffle/behind offsets, obstacle-climb steering and close-range snapping. Interaction requires both prompt-range proximity and a small vertical gap, then stops and removes the movement forces. Combat travel remains unchanged.

The actual controller passes regression tests for a rotated Noah, zero vertical offset, no combat key, disabled climb/snap, capped approach speed and descending before interaction. The complete build compiles. GPO behavior still requires user testing.
