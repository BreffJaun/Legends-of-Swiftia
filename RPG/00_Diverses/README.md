# Development Plan

| ✅  | Day & Date           | Ticket | Task                                                                                                 |
|-----|----------------------|--------|----------------------------------------------------------------------------------------------------|
| ✅   | Monday, 30.06.2025   | #241   | Create UML diagram                                                                                |
| ✅   |                      | #242   | Create pseudocode file with high-level game logic outline                                         |
| ✅   |                      | #242   | Plan rough timeline considering dependencies on other tickets                                     |
| ✅   |                      | #243   | Create project folder structure: Classes, Structs, Utilities                                      |
| ✅   |                      | #243   | Move classes to separate files under Classes folder                                               |
| ✅   |                      | #243   | Move structs to separate files under Structs folder                                               |
| ✅   |                      | #243   | Consolidate Enums, Extensions, Protocols into respective single files under Utilities folder      |
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
| ⬜   | Friday, 04.07.2025   | #248   | Initialize `Game` class and implement `printStatus()`                                             |
| ⬜   |                      | #249   | Implement round-based system (loop or recursion)                                                  |
| ⬜   |                      | #249   | Allow hero action selection via console (attack, heal, use item)                                  |
| ⬜   |                      | #249   | Allow hero to select which enemy to attack                                                        |
| ⬜   |                      | #250   | Implement enemy actions with random selection                                                     |
| ⬜   |                      | #250   | Enemy performs actions against heroes                                                             |
| ⬜   |                      | #250   | Update HP and handle action resolution                                                            |
| ⬜   |                      | #251   | Implement status effects (poison, paralyze)                                                       |
| ⬜   |                      | #251   | Add status effect logic in round system                                                           |
| ⬜   |                      | #251   | Improve console output for status effects and actions                                             |
| ⬜   |                      | #251   | Add clear game-end detection and output winning team message                                      |
| ⬜   |                      | #252   | Create new enemy class `Minion` (Scherge)                                                         |
| ⬜   |                      | #252   | Implement condition for adding `Minion` once (e.g., main enemy HP ≤ 50%)                          |
| ⬜   |                      | #252   | Allow heroes to choose new enemies as targets                                                     |
| ⬜   |                      | #252   | Implement `Minion` as shield for main enemy                                                       |


