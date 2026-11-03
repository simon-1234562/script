# Removal and restoration inventory

Build: compact-profiles-v8. The user-confirmed Noah checkpoint is [commit 51ca7a78](https://github.com/simon-1234562/script/blob/51ca7a78d5cbc85ad704784aa08c7e69ed34174b/Tensen-GPO-local.luau). Its [pinned loader](loader-dialogue-v7.luau) is retained. That checkpoint already had the earlier splash/music/security cleanup; use original supplied sources only as references for those older removed features.

| Removed or disabled | Scope / reason | Where to restore from |
| --- | --- | --- |
| Startup splash and large logo animation | No loading overlay or logo asset fetch | Original embedded CreateWindow loader |
| Music player, playlist and Sound listeners | Decorative audio | Original embedded buildMusicPlayer |
| Sidebar avatar/profile, branding art and status promotion | Replaced with a compact text header | Checkpoint embedded CreateWindow |
| FPS/performance graph and decorative UI render work | No UI per-frame callbacks or editable graph image | Checkpoint embedded CreateWindow |
| Ripple, shimmer, animated selection effects and UI tweens | Control feedback now applies directly | Checkpoint embedded UI helpers/window |
| Old wide sidebar and bottom hotbar | Replaced by horizontal navigation and subnavigation | Checkpoint UI window and tab layout |
| Player ESP controls and enablement | Island/loot ESP retained; player ESP forced off | Checkpoint ESP UI; inactive backend helpers may remain |
| Animated/rainbow/pulsing ESP options | Flags forced off; static island ESP retained | Checkpoint ESP settings |
| PvP/player-target UI, selection and movement worker | Removed player-chasing path; manual NPC farming retained | Checkpoint autoFarmPlayerTab and F2.TweenToPlayer worker |
| Auto Trade UI and worker | Removed account/item exchange automation | Checkpoint Trade UI and auto trade worker |
| Configuration autoload, autoload toggle and buttons | Startup remains idle; explicit Load Config retained and repaired | Checkpoint config/autoload block |
| Destructive anti-tamper, UI-presence/admin reporting | Earlier cleanup; not restored | Original supplied recovery source only |
| Discarded startup VirtualInputManager construction | Earlier unused construction | Original hub startup |

## Preserved

Existing NPC movement/M1, combat settings, recovered advanced routes, Juzo/Mihawk/Roger/Big Mama, fishing, fish selling, bait crafting, fruit storage, merchant automation, auto stats, travel/private server, movement/protection QoL, static island/loot ESP, performance options and manual configs remain. These inherited modes were preserved, not independently verified in game. Battle Royale retains its dungeon/loot interface; player-target automation was removed.

The literal-flag audit removes only the 20 controls listed below and adds QuestProfileChoice, QuestEnemyOverride and QuestGiverOverride. Counts are 149 unique literal flags before and 132 after; dynamically constructed flags are outside that count. Some unused compatibility helper definitions remain; removal of a UI/worker does not mean every related symbol was deleted.

Removed flags: TradeMainAccountInput, TradeItemAltDropdown, TradeItemMainDropdown, TradeMainSendQtySlider, TradeTimeoutSlider, AutoTradeToggle, ESP_PlayerTeamNames, SelectPlayerDropdown, PvPAutoTargetToggle, PvPSkipTeammatesToggle, TweenToPlayerToggle, PvP_PvPFeintOnBlock, PvP_PvPShuffle, PvP_PvPAutoEquip, PvPOffsetSlider, PvPRangeSlider, PvP_PvPShuffleStuds, PvP_PvPShufflePeriod, PvP_PvPFeintRetry, AutoLoadToggle.

## Restoration

Use the pinned checkpoint to restore individual removed controls together with their workers and dependencies. Restoring an entire checkpoint also restores its older interface. Do not combine a restored movement or trade worker with a second live copy. Restart Roblox between versions. Hardcoded author reporting and outsider shutdown from the extra reference sources were never imported; see ADDITIONAL-SOURCE-REVIEW.md.

## Ground movement change (v9)

The manual NPC driver and main quest-giver approach no longer call the legacy tween engine. They use a shared ground path walker. The existing TweenToNPCToggle config flag is retained under the visible name Walk To NPC. NPC hover/height and shuffle controls remain for compatibility with legacy code but are ignored by this walker. Independent advanced farm and island-travel tweens are retained. The pre-walking build is [commit e55a1abb](https://github.com/simon-1234562/script/blob/e55a1abbf41c674f9ee2c2cd29b823f8bd80f289/Tensen-GPO-local.luau).

## Island flight removal (v10)

Removed the TweenToIsland worker's direct flight/close-teleport call. The visible control is now Walk To Island (land only), limited to nearby ground paths. Longer trips require a boat. StartTweenIslandToggle remains compatible. The previous worker can be found at commit 8e2afa40a3632cbb97417bfaa07f661ebbdd0331; restoring it restores ocean flight behavior.

## NPC tween restoration (v11)

At the user's request, NPC combat and giver approach use tween movement again. The visible manual control is Tween To NPC with its existing flag. Combat uses a six-stud height cap and a 40 speed cap, with no close teleport request; the giver front offset remains at root height. The island flight removal remains in effect. v9/v10 descriptions of ground-only NPC movement are historical.
