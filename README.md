# yanus hub: Sandora farming test

Rejoin for a fresh Roblox session. Run the normal loader from loader.luau, wait for the hub to finish loading, then enable the main Auto Farm control in the Auto Farm tab. The separate diagnostic scripts do not load movement or farming helpers. Keep Auto Load off while testing.

The main control currently supports First Sea Sandora levels 10-19. It reads the level, chooses Desert Bandit, enables the existing NPC movement/M1 path, reads the active quest, and handles returning to Noah to accept the quest again. You no longer need to select the bandit or enable Tween To NPC separately. Your configured weapon setting is retained. Switching off restores the previous NPC selection/toggle. The control starts off every session and is not persisted in configs.

Confirmed from the supplied live diagnostic:
- Noah: workspace.NPCs.Noah, with an interaction prompt.
- Enemy model: workspace.NPCs['Desert Bandit'].
- Active quest title: PlayerGui.Quest.Main.Info.Top.QuestName.
- Progress: PlayerGui.Quest.Main.Info.Top.Progress, e.g. '0 / 7 Desert Bandit'.
- PlayerGui.Dialogue is present. Dialogue choices still require in-game interaction verification.

The normal quest reader ignores QuestTracker recommendations and hidden TrackedDaily objectives. When a quest is active, the existing NPC/M1 routines farm. When it ends, those routines pause while collecting the next quest. On reaching level 20, it stops before accepting another quest because the next island route is not implemented. This is not an all-level farming release.

Recovered Quest Routes (Advanced) and the other original farming modes remain separate. Keep conflicting travel/farm modes off during this test. The full simpler navigation and removal of unrelated PvP/trade controls are still pending. See REMOVALS.md for completed cleanup and restoration references.

## Validation

Official Luau 0.745 compiles the build. Isolated tests pass against the actual controller for the reported GUI hierarchy, progress display, automatic NPC selection/restoration, startup idle state, Noah prompt, dialogue choices, movement lock/release, timeouts, missing helpers, hidden quest panels and level boundaries. All 153 original literal feature flags remain. No GPO session was used to validate the new quest cycle; the user previously confirmed manual NPC tweening/M1 work.

The loading splash, music player, original default logo, promotional footer and an unused startup constructor have been removed. Original author attribution remains in source. Other recovered features may still be incomplete. Executor-based farming has no ban-free guarantee.
