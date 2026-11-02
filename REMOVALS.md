# yanus hub: removal and restoration inventory

Backup before this cleanup: GitHub commit 6931a502ee4aa2527fbb8615c9ed020395ab7ca0 contains the prior full script. Restoring it also restores the older Noah travel helper, so use it only as a reference for bringing individual features back.

## Removed in this pass

| Item | Reason | Restoration reference |
| --- | --- | --- |
| Startup loading/splash animation | Avoid the startup overlay and its animation work | Old CreateWindow LoadingAnimation option and loader block |
| Built-in music player, playlist panel, sound instance and its listeners | Unrelated to farming or quality of life | Old embedded buildMusicPlayer function |
| Default Tensen logo asset | Replace old branding without loading a decorative logo | Old embedded DEFAULT_LOGO |
| Tensen window title and Discord promotion in the footer | Rebrand visible interface | Old CreateWindow Name, BrandSubtitle and StatusText options |
| Unused top-level VirtualInputManager construction | Returned object was discarded | Original hub startup just after PlayersService/RunService |

Original author attribution remains in source comments. Tensen-named internal globals and config folders are retained for compatibility. All 153 original literal feature flags and their farming code remain.

## Excluded from the newly supplied reference scripts

Hardcoded author webhooks, outsider shutdown, and whole-hub imports. Neither reference file was executed or merged wholesale. See ADDITIONAL-SOURCE-REVIEW.md for details.

## Pending simplification

The complete simpler navigation and removal of unrelated PvP/trade controls have not shipped. Profile/performance panels and other original controls still exist. A unified Auto Farm control now offers Noah's quest at level 10+ with no upper cutoff, plus a current-quest combat mode requiring manual quest acceptance. Complete quest progression across islands is not implemented.

## Current quest correction

Return to Noah now calls the same TweenToMob2 entry point as the working Tween To NPC feature. Noah lookup uses direct NPC models, avoiding the clothing/accessory scan. Compilation and isolated controller tests pass; in-game movement and quest acceptance remain unverified.
