# Development Plan

| ✅   | Day & Date           | Ticket | Task                                                                                              |
|------|----------------------|--------|---------------------------------------------------------------------------------------------------|
| ✅   | Monday, 30.06.2025   | #241   | Create UML diagram                                                                                |
| ✅   |                      | #242   | Create pseudocode file with high-level game logic outline                                         |
| ✅   |                      | #242   | Plan rough timeline considering dependencies on other tickets                                     |
| ✅   |                      | #243   | Create project folder structure: Classes, Structs, Utilities                                      |
| ✅   |                      | #243   | Move classes to separate files under Classes folder                                               |
| ✅   |                      | #243   | Move structs to separate files under Structs folder                                               |
| ✅   | Tuesday, 01.07.2025  | #244   | Implement superclass `Character` with properties: `name`, `hp`, `maxHp`                           |
| ✅   |                      | #244   | Create empty subclasses `Hero` and `Enemy` inheriting from `Character`                            |
| ✅   |                      | #245   | Implement 3 specialized `Hero` subclasses (e.g., `Mage`, `Warrior`, `Healer`)                     |
| ✅   |                      | #245   | Add at least one unique property or method per hero subclass                                      |
| ✅   |                      | #245   | Ensure each hero inherits `name`, `hp`, `maxHp`, `attackValue`, `defenseValue`                    |
| ✅   | Wednesday, 02.07.2025| #246   | Implement `Endboss` class inheriting from `Enemy`                                                 |
| ✅   |                      | #246   | Add multi-target area attack method to `Endboss`                                                  |
| ✅   |                      | #246   | Add method to summon `Minion` when Endboss HP ≤ 50%                                               |
| ✅   |                      | #246   | Create `Minion` class inheriting from `Enemy` with unique method/property                         |
| ✅   |                      | #246   | Implement additional special attacks or status effects (curse, heal, bombastic attack)            |
| ✅   | Thursday, 03.07.2025 | #247   | Implement `Item` struct with properties (name, damage, defense, uses, etc.)                       |
| ✅   |                      | #247   | Implement `Bag` struct containing array of `Item`s                                                |
| ✅   |                      | #247   | Implement `menu()` method in `Bag` for item selection via console input                           |
| ✅   |                      | #247   | Implement item usage decrement/removal logic                                                      |
| ✅   |                      | #247   | Plan integration of `Bag` with heroes for later use                                               |
| ✅   |                      | #248   | Create Enums into respective single file under Utilities folder                                   |
| ✅   |                      | #249   | Create Extensions into respective single file under Utilities folder                              |
| ✅   |                      | #250   | Create Protocols into respective single file under Utilities folder                               |
| ⬜   | Friday, 04.07.2025   | #251   | Initialize `Game` class and implement `printStatus()`                                             |
| ⬜   |                      | #251   | Implement round-based system (loop or recursion)                                                  |
| ⬜   |                      | #251   | Allow hero action selection via console (attack, heal, use item)                                  |
| ⬜   |                      | #251   | Allow hero to select which enemy to attack                                                        |
| ⬜   |                      | #252   | Implement `Minion` (or `Scherge`) class                                                           |
| ⬜   |                      | #252   | Add condition: summon minion if Boss HP ≤ 50 %                                                    |
| ⬜   |                      | #252   | Add minion to `enemies` array only once                                                           |
| ⬜   |                      | #252   | Update target selection logic: heroes can select any enemy                                        |
| ⬜   |                      | #252   | Optional: boss becomes untargetable until minion is defeated                                      |
| ⬜   |                      | #253   | Add `xp` and `level` properties to `Hero` class                                                   |
| ⬜   |                      | #253   | Define XP thresholds for Level 1–3                                                                |
| ⬜   |                      | #253   | Grant XP after defeating enemies                                                                  |
| ⬜   |                      | #253   | Implement `levelUp()` method                                                                      |
| ⬜   |                      | #253   | Enhance attributes on level-up (e.g., +HP, +damage)                                               |
| ⬜   |                      | #253   | Display XP, level, and progress in `description` or UI                                            |
| ⬜   |                      | #253   | (Optional) Add visual feedback on level-up (e.g. print with ✨)                                   |


| ✅   | Day & Date           | Ticket | Task                                                                                              |
|------|----------------------|--------|---------------------------------------------------------------------------------------------------|
| ⬜   | Monday, 07.07.2025   | #254   | Create method to display all relevant hero info                                                   |
| ⬜   |                      | #254   | Show HP, status (e.g. poisoned, paralyzed), XP and level                                          |
| ⬜   |                      | #254   | Implement progress indicator for XP (e.g. e.g. XP: 120/250)                                       |
| ⬜   |                      | #254   | Optional: Highlight special statuses in color or with symbols                                     |
| ⬜   |                      | #254   | Integrate display into existing `printStatus()` method of the Game class                          |
| ⬜   |                      | #255   | Implement a day-night cycle system with at least two phases (e.g., day and night)                 |
| ⬜   |                      | #255   | Create a method that automatically switches between phases (based on round or timer)              |
| ⬜   |                      | #255   | Add at least two events or changes depending on the current cycle phase                           |
| ⬜   |                      | #255   | Display the current cycle phase visually in the console (e.g., via symbols or colors)             |
| ⬜   |                      | #255   | Integrate the cycle effects into gameplay (e.g., enemy type, ability changes, etc.)               |
| ⬜   | Tuesday, 08.07.2025  | #256   | Use `sleep()` function to delay output for dramatic or informative effect                         |
| ⬜   |                      | #256   | Implement `didSet` to react dynamically to status changes                                         |
| ⬜   |                      | #256   | Integrate emojis and/or ASCII art into console output                                             |
| ⬜   |                      | #256   | Add colors to console output (test in Terminal, not in Xcode default console)                     |
| ⬜   |                      | #256   | Combine formatting, delays, and symbols to create animation-like console effects                  |
| ⬜   |                      | #257   | Add dynamic color output for hero HP: green (high), yellow (medium), red (low/critical)           |
| ⬜   |                      | #257   | Display all boss/miniboss-related messages in a unique color                                      |
| ⬜   |                      | #257   | Integrate sound effects for actions like attacks, potion use, and hero death                      |
| ⬜   |                      | #257   | Implement rare items with conditional availability (e.g., only when 1 hero remains)               |
| ⬜   |                      | #257   | Add item/effect to double hero’s attack power for 1 round                                         |
| ⬜   |                      | #257   | Add item/effect to revive a fallen hero                                                           |
| ⬜   |                      | #257   | Add item/effect to curse an enemy (lose 15 HP per round)                                          |
| ⬜   |                      | #257   | Implement `paralyze()` effect to stun an enemy for 1 round                                        |
| ⬜   |                      | #257   | Implement confusion effect: enemy attacks itself or its minion for 1 round                        |
| ⬜   |                      | #257   | Introduce elemental system (e.g., Fire > Plant, Water < Plant, etc.)                              |
| ⬜   |                      | #257   | Implement combination attacks (2+ heroes perform a strong or special move)                        |
| ⬜   |                      | #257   | Ensure heroes in combination attacks cannot act individually in the same round                    |
| ⬜   |                      | #258   | Implement a system for random events (e.g. 5% probability)                                        |
| ⬜   |                      | #258   | Add at least two types of random events                                                           |
| ⬜   |                      | #258   | Example event: critical hit → deals double damage                                                 |
| ⬜   |                      | #258   | Example event: treasure chest randomly appears                                                    |
| ⬜   |                      | #258   | Use random number generators to calculate probabilities                                           |
| ⬜   |                      | #258   | Visually highlight random events (e.g. with special symbols, colors, or console animation)        |
| ⬜   |                      | #258   | Add visual cues that draw user attention to random events                                         |
| ⬜   |                      | #258   | Ensure consistent visual formatting for easy recognition of different random event types          |
| ⬜   | Wednesday, 09.07.2025| ---    | General Debugging: Fix known or emerging bugs                                                     |
| ⬜   |                      | ---    | Code Refactoring: Clean up redundant, messy, or duplicated logic                                  |
| ⬜   |                      | ---    | Visual Polish: Improve console output with better layout, consistent formatting, colors           |
| ⬜   |                      | ---    | Review previous tickets: Ensure all requirements are fully met                                    |
| ⬜   |                      | ---    | Optional: Add quality-of-life improvements or micro-features                                      |


