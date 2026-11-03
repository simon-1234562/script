# ground-paths-v9

Quest acceptance/combat/return was reported working, but direct NPC tweening crossed rocks and used an airborne offset. The shared NPC driver and quest-giver approach now walk around obstacles with normal pathfinding. No collision changes, root-position writes, hover offsets or movement movers are used by this new route. Existing independent boss/travel tweens remain unchanged.

Route failures stop and show a reason. Fast Walk is paused while navigating. Noclip must be off. Walking requires loaded ground/path geometry; it is not a guarantee against game kicks.

Compilation and isolated quest, waypoint, blocked-path, timeout, airborne, cancellation and NPC-driver tests pass. Ground movement has not yet been tested in GPO. The earlier compact UI/removal history is described in REMOVALS.md and the prior commit.
