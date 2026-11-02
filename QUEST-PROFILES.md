# Quest profiles

Noah is the default. Other named profiles are labelled **test**, use loaded giver/enemy names instead of invented quest remote IDs, and require live testing. Selection has minimum levels only, so a player can keep choosing Noah above level 20.

| Island | Giver | Enemy | Minimum | Verification |
| --- | --- | --- | --- | --- |
| Sandora | Noah | Desert Bandit | 10 | User confirmed full acceptance, combat and return cycle in v7 |
| Town of Beginnings | Daph | Bandit | 0 | Wiki-derived; simulated controller test |
| Town of Beginnings | Ronny | Bandit Boss | 5 | Wiki-derived; live test needed |
| Sandora | Tyrone | Lucid | 15 | Giver name from supplied live NPC list; wiki quest minimum; live cycle needed |
| Shell's Town | Robert | Corrupt Marine / Corrupted Marine | 20 | Wiki-derived; alias matching simulated |
| Shell's Town | Kevin | Shell's Bandit / Shells Bandit / Shell Bandit | 25 | Wiki-derived; live test needed |
| Shell's Town | Gozen | Axe Hand Logan | 30 | Wiki-derived; alternate dialogue text simulated |

The wiki lists the basic quest requirements on its [NPC list](https://grand-piece-online.fandom.com/wiki/NPCs). Sandora's quests and inhabitants are on [Sandora](https://grand-piece-online.fandom.com/wiki/Sandora); Noah's specific requirement and dialogue are on [Noah](https://grand-piece-online.fandom.com/wiki/Noah). These community pages were consulted on 2026-11-02. Wiki facts do not establish executor or current game compatibility.

**Recommended nearby** selects the highest eligible non-boss among these profiles with a loaded giver within 1,500 studs. It does not include all islands or provide inter-island progression. Boss profiles require explicit selection. During an active matching quest it keeps farming that quest; at completion it can select another eligible local profile.

**Current quest** supports nearby kill quests in either sea, with manual acceptance/renewal. **Custom** requires exact giver and enemy names and uses the current place. Neither mode implements delivery, collection or purchase quests.

The dialogue helper prioritizes the supplied NPCCHAT/Frame/go hierarchy. It invokes one supported click handler type or falls back to a screen click with GUI inset. It checks visible state, rejects purchase-labelled choices and waits for an actual matching Quest panel before starting combat. Shared button structure does not guarantee every NPC's conversation has identical meaning.
