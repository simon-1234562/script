# yanus hub

Build: ground-paths-v9. Rejoin before testing this update; running a second copy in the same session can leave old workers alive.

## Load

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/simon-1234562/script/main/Tensen-GPO-local.luau"))()
```

Open **Farm → Quest**, choose a quest, then enable **Auto Farm**. Noah is the default and was confirmed working by the user before this update. The controller accepts a kill quest, selects its enemy, farms with the existing NPC/M1 settings, and returns for renewal. Changing quest settings stops the running quest farm. Keep other movement/farming modes off while using it.

## Quest choices

- **Sandora - Desert Bandits (Noah):** level 10+, with no upper cutoff.
- **Recommended nearby quest (test):** reads level and chooses the highest eligible non-boss profile with its giver loaded within 1,500 studs. It can change profiles between quests. It does not sail or travel between islands.
- **Named profiles (test):** Daph, Ronny, Tyrone, Robert, Kevin and Gozen. These use the shared positive dialogue button and must still be verified in game. See [QUEST-PROFILES.md](QUEST-PROFILES.md).
- **Use current quest (accept manually):** farms a nearby kill quest already accepted in game. At completion it pauses until another quest is accepted. Works in both seas; an exact enemy override is optional.
- **Custom quest giver and enemy (test):** supply exact loaded NPC giver and enemy names. Uses the same interaction and quest-confirmation checks; it is intended for kill quests, not deliveries, purchases or collection tasks.

A displayed recommendation is not proof of a route's live compatibility. If a giver, required level, prompt, dialogue or active quest cannot be confirmed, the controller stops instead of farming an unrelated target. Purchase-labelled dialogue choices are rejected. Only Noah has user-confirmed in-game quest cycling; the other profiles have isolated simulated coverage.

## Compact interface

- **Farm:** one main quest Auto Farm control, quest selection, status and emergency stop.
- **Other farms:** existing combat settings, manual NPC/legacy routes, bosses, stats, fishing, selling fish, bait, fruit storage and merchant controls.
- **Travel:** teleport/tween, private server and island ESP.
- **QoL:** movement and protection controls.
- **Settings:** performance/options and manual configuration loading. Configurations no longer load automatically at startup.

**Hide**, the floating **yanus** button, and **RightShift** toggle the window. The startup splash, music, avatar/profile panel, FPS graph and UI animation effects are removed. UI notifications are capped at three. See [REMOVALS.md](REMOVALS.md) for the complete removal and restoration inventory.

Auto Farm starts off. Stop Auto Farm or use **STOP NPC MOVEMENT** to release movement. Turning off the manual NPC tween also stops the quest driver. A separate [release-movement.luau](release-movement.luau) is available for a stuck older session.

## Validation and fallback

The complete build compiles with official Luau 0.745. Isolated tests exercise the actual quest controller, movement cleanup, toggle hit areas, quest diagnostic and compact UI. Navigation mounts in First Sea, Second Sea and Battle Royale mocks. The compact UI creates no render-frame listener, sound or FPS image. These checks do not measure live FPS or establish live compatibility of new routes. See [VALIDATION.txt](VALIDATION.txt).

[Known working Noah loader](loader-dialogue-v7.luau) pins the version the user confirmed working, before this UI/profile update. It is available for comparison and rollback. Existing config folder names and internal Tensen aliases remain for compatibility; original source attribution remains. No hardcoded author webhooks or outsider shutdown code from the additional references was imported. Executor automation cannot be guaranteed ban-free.

## Ground movement update

Quest travel and the manual NPC control now use PathfindingService waypoints and Humanoid walking around obstacles. The manual control is named **Walk To NPC**, keeping its existing config flag for compatibility. These paths do not change collisions, write root CFrames or create hover movers. The old NPC height/shuffle settings do not affect this walking mode. Fast Walk is paused during navigation, and fabricated movement-signal sends are skipped while a route is running. Noclip must be off.

Blocked paths are recalculated. Missing floor, unavailable paths, ten seconds without movement or prolonged airborne state stops the route with a status message; there is no straight-line teleport fallback. The giver return limit is 120 seconds to allow walking. This update does not replace the independent advanced boss, legacy quest or island tween engines. The ground changes compile and pass simulated route tests but still need live verification.

Implementation references: [Roblox pathfinding](https://create.roblox.com/docs/characters/pathfinding) and [Humanoid movement](https://create.roblox.com/docs/reference/engine/classes/Humanoid).
