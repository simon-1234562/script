# dialogue-any-position-v11

NPC combat and quest-giver approach use tween movement again at the user's request. NPC combat height is capped at six studs, speed at 40; no close teleport is requested. The giver approach retains its front offset at root height and capped approach speed. Island ocean flight remains disabled.

The quest helper scans visible NPCCHAT/Dialogue choices by label and hierarchy, rather than requiring NPCCHAT/Frame/go or a left-hand button. It recognizes centered ellipsis, Continue/Next and common positive acceptance labels, including nested labels. Hidden, decline and purchase-labelled choices are excluded. Click fallback uses the chosen button's current position. It still confirms the matching quest before combat. Unknown dialogue wording may require a diagnostic.

Compilation and actual-controller simulated tests pass, including Kevin-style center/repositioned choices, Unicode ellipsis, nested labels, decline/purchase exclusions, NPC tween dispatch and existing dialogue/stop regressions. Live verification remains pending; movement compatibility is not guaranteed.
