# Development Plan

| ✅  | Day & Date           | Ticket | Task                                                                                                 |
|-----|----------------------|--------|----------------------------------------------------------------------------------------------------|
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
| ⬜   |                      | #252   | Implement enemy actions with random selection                                                     |
| ⬜   |                      | #252   | Enemy performs actions against heroes                                                             |
| ⬜   |                      | #252   | Update HP and handle action resolution                                                            |
| ⬜   |                      | #252   | Implement status effects (poison, paralyze)                                                       |
| ⬜   |                      | #252   | Add status effect logic in round system                                                           |



