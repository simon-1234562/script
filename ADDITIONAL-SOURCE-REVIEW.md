# Additional source review for yanus hub

Static review only. Neither supplied source was executed or uploaded. This is a targeted review, not a full security audit.

## zephyron claude hub.txt

218,023 bytes. Primarily dungeon/Impel Down-style farming, movement and shop/merchant reporting. No Sandora, Noah, Desert Bandit, quest table or normal quest-taking implementation found.

The movement helper tweenWithTeleport (around line 3883) depends on script-wide character state, stage data, farm state and teleport logic. It is not a drop-in replacement for the already-working NPC tween. User-configured webhook sends exist (around lines 5413, 5523, 5584). The 'SECRET WEBHOOKS' comments around lines 5292-5333 refer to blocks whose network sends are absent in this supplied copy; comments alone do not establish that these blocks currently transmit data.

## wyverncinderpoopsourceOPUS (2).txt

505,322 bytes. Lazy modules include bosses, fishing, factory, merchant, fruit inventory, movement and Kraken role automation. No Sandora, Noah, Desert Bandit or standard level-to-quest routes found.

Core has hardcoded author webhook calls around lines 281-282 and 692-693, including error reports with player and server details. Startup defines an actual HTTP-backed LRM_SEND_WEBHOOK wrapper around lines 16065-16080. A configured outsider watcher can call game:Shutdown() around lines 350-380. The UI exposes that outsider shutdown setting. These behaviors should not be copied into yanus hub.

## Reuse decision

Prefer retaining the user's tested NPC movement and M1 code. Potentially useful references are cleanup/lifecycle patterns, lazy module initialization and bounded waits. Avoid combining both complete hubs: this would add duplicate loops, unrelated features, reporting and startup overhead without supplying the missing quest routes.

Exclude all hardcoded author reporting, outsider shutdown, user-name spoofing, promotional content, decorative animations and unrequested webhook behavior from any imported code. Retain all current farming features until the separate removal inventory is complete. The sources remain unchanged on disk.

## Current integration status

The user subsequently confirmed the Noah dialogue and complete quest cycle in v7. The compact-profiles-v8 update simplifies the UI and adds opt-in early quest profiles using the existing controller, rather than importing either reference hub. Additional routes still need live verification. See README.md, QUEST-PROFILES.md and REMOVALS.md.
