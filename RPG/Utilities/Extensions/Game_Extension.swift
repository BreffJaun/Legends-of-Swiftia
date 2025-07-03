//
//  StorySteps.swift
//  RPG
//
//  Created by Jeff Braun on 03.07.25.
//

import Foundation


// MARK: DIFFERENT DIFFICULTY STORIES
extension Game {
    func easyStorySteps() -> [StoryStep] {
        return [
            StoryStep(
                title: "Step 1: Forest Entrance",
                descriptionLines: [
                    "You arrive at the edge of the Emerald Grove.",
                    "The sun filters through the leaves, birds sing.",
                    "What do you do?"
                ],
                choices: [
                    Choice(
                        description: ["Look under the rock"],
                        effect: { heroes in
                            for hero in heroes {
                                hero.bag.items.append(Item(name: "Healing Potion", health: 20, damage: 0, defense: 0, usesLeft: 1))
                            }
                        },
                        consequenceText: [
                            "You found healing potions under the rock! They are",
                            "added to all companions' bags."
                        ]
                    ),
                    Choice(
                        description: ["Check behind the bush"],
                        effect: { heroes in
                            for hero in heroes {
                                hero.hp = hero.maxHp
                            }
                        },
                        consequenceText: [
                            "A mystical fairy appears and heals all your",
                            "companions completely!"
                        ]
                    ),
                    Choice(
                        description: ["Follow the screams"],
                        effect: { heroes in
                            self.fight(heroes: heroes, minions: 3)
                        },
                        consequenceText: [
                            "You encounter 3 hostile minions! Prepare for",
                            "battle!"
                        ]
                    ),
                    Choice(
                        description: ["Do nothing"],
                        effect: { _ in },
                        consequenceText: [
                            "You wait and observe, the forest remains quiet",
                            "for now."
                        ]
                    )
                    
                ]
            ),
            StoryStep(
                title: "Step 2: Deeper into the Grove",
                descriptionLines: [
                    "The forest thickens and shadows dance between the trees.",
                    "Your path splits into several directions."
                ],
                choices: [
                    Choice(
                        description: ["Search near the old tree stump"],
                        effect: { heroes in
                            for hero in heroes {
                                hero.bag.items.append(Item(name: "Defendo Elixir", health: 0, damage: 0, defense: 20, usesLeft: 1))
                            }
                        },
                        consequenceText: [
                            "You find mana elixirs hidden near the stump and",
                            "add them to your companions’ bags."
                        ]
                    ),
                    Choice(
                        description: ["Inspect the strange footprints"],
                        effect: { _ in },
                        consequenceText: [
                            "The footprints lead you to a hidden trap, but you",
                            "manage to avoid it."
                        ]
                    ),
                    Choice(
                        description: ["Call out to the forest spirits"],
                        effect: { heroes in
                            for hero in heroes {
                                hero.hp += 10
                                if hero.hp > hero.maxHp { hero.hp = hero.maxHp }
                            }
                        },
                        consequenceText: [
                            "The spirits bless you and restore some health to",
                            "all companions."
                        ]
                    ),
                    Choice(
                        description: ["Rest for a moment"],
                        effect: { _ in },
                        consequenceText: [
                            "You take a moment to catch your breath, nothing",
                            "happens."
                        ]
                    )
                ]
            ),
            StoryStep(
                title: "Step 3: Mystic Pond",
                descriptionLines: [
                    "You find a glowing pond with crystal-clear water.",
                    "It radiates magical energy."
                ],
                choices: [
                    Choice(
                        description: ["Drink from the pond"],
                        effect: { heroes in
                            for hero in heroes {
                                hero.hp = hero.maxHp
                            }
                        },
                        consequenceText: [
                            "The water heals all wounds. Everyone is at full",
                            "strength."
                        ]
                    ),
                    Choice(
                        description: ["Collect water in a vial"],
                        effect: { heroes in
                            for hero in heroes {
                                hero.bag.items.append(Item(name: "Mystic Water", health: 0, damage: 20, defense: 0, usesLeft: 1))
                            }
                        },
                        consequenceText: [
                            "You bottle the magical water. It might be useful",
                            "later."
                        ]
                    ),
                    Choice(
                        description: ["Meditate by the pond"],
                        effect: { _ in },
                        consequenceText: [
                            "You feel calm and focused, but nothing tangible",
                            "happens."
                        ]
                    ),
                    Choice(
                        description: ["Ignore the pond and move on"],
                        effect: { _ in },
                        consequenceText: [
                            "You decide not to risk it and leave the area."
                        ]
                    )
                ]
            ),
            StoryStep(
                title: "Step 4: Abandoned Camp",
                descriptionLines: [
                    "You stumble upon a deserted camp.",
                    "Ashes are still warm in the firepit."
                ],
                choices: [
                    Choice(
                        description: ["Search the tents"],
                        effect: { heroes in
                            for hero in heroes {
                                hero.bag.items.append(Item(name: "Ration", health: 5, damage: 0, defense: 0, usesLeft: 1))
                            }
                        },
                        consequenceText: [
                            "You find some food supplies and distribute them",
                            "among the group."
                        ]
                    ),
                    Choice(
                        description: ["Examine the tracks"],
                        effect: { _ in },
                        consequenceText: [
                            "The tracks suggest a hasty departure, possibly",
                            "due to danger."
                        ]
                    ),
                    Choice(
                        description: ["Wait and watch"],
                        effect: { _ in },
                        consequenceText: [
                            "After a while, nothing happens. The camp remains",
                            "silent."
                        ]
                    ),
                    Choice(
                        description: ["Call out to see if anyone's there"],
                        effect: { _ in },
                        consequenceText: [
                            "Your voice echoes. No response."
                        ]
                    )
                ]
            ),
            StoryStep(
                title: "Step 5: Ancient Stone Circle",
                descriptionLines: [
                    "At the forest's heart stands a ring of ancient stones.",
                    "Mysterious runes glow faintly on them."
                ],
                choices: [
                    Choice(
                        description: ["Touch the central stone"],
                        effect: { heroes in
                            for hero in heroes {
                                hero.bag.items.append(Item(name: "Rune of Power", health: 0, damage: 10, defense: 0, usesLeft: 1))
                            }
                        },
                        consequenceText: [
                            "You receive a Rune of Power. It pulses with",
                            "ancient magic."
                        ]
                    ),
                    Choice(
                        description: ["Try to decipher the runes"],
                        effect: { _ in },
                        consequenceText: [
                            "You partially understand the symbols — they speak",
                            "of trials ahead."
                        ]
                    ),
                    Choice(
                        description: ["Destroy one of the stones"],
                        effect: { _ in },
                        consequenceText: [
                            "A dark cloud swirls briefly, then vanishes.",
                            "Best not do that again."
                        ]
                    ),
                    Choice(
                        description: ["Sit quietly and listen"],
                        effect: { _ in },
                        consequenceText: [
                            "You hear faint whispers guiding your path.",
                            "You feel watched."
                        ]
                    )
                    
                ]
            )
        ]
    }
    
    func normalStorySteps() -> [StoryStep] {
        return [
            StoryStep(
                title: "Step 1: Forest Entrance",
                descriptionLines: [
                    "You arrive at the edge of the Emerald Grove.",
                    "The sun filters through the leaves, birds sing.",
                    "What do you do?"
                ],
                choices: [
                    Choice(
                        description: ["Look under the rock"],
                        effect: { heroes in
                            for hero in heroes {
                                hero.bag.items.append(Item(name: "Healing Potion", health: 20, damage: 0, defense: 0, usesLeft: 1))
                            }
                        },
                        consequenceText: [
                            "You found healing potions under the rock! They are",
                            "added to all companions' bags."
                        ]
                    )
                ]
            )
        ]
    }
    
    
    func hardStorySteps() -> [StoryStep] {
        return [
            StoryStep(
                title: "Step 1: Forest Entrance",
                descriptionLines: [
                    "You arrive at the edge of the Emerald Grove.",
                    "The sun filters through the leaves, birds sing.",
                    "What do you do?"
                ],
                choices: [
                    Choice(
                        description: ["Look under the rock"],
                        effect: { heroes in
                            for hero in heroes {
                                hero.bag.items.append(Item(name: "Healing Potion", health: 20, damage: 0, defense: 0, usesLeft: 1))
                            }
                        },
                        consequenceText: [
                            "You found healing potions under the rock! They are",
                            "added to all companions' bags."
                        ]
                    )
                ]
            )
        ]
    }
    
    
    func fight(heroes: [Hero], minions: Int, includeBoss: Bool = false)  {
        let player = heroes[0]
        let companions = heroes.dropFirst().filter { $0.isAlive() }
        
//        var enemies: [Enemy] = []
        //        let randomInt = Int.random(in: 1...5)companions
        // Vielleicht über einen Randomizer lösen? Später noch mal schauen
        for i in 1...minions {
            enemies.append(Minion(name: "Minion \(i)", hp: 30))
        }
        
        if includeBoss {
            enemies.append(Boss(curseDuration: 5, name: "XCodia", hp: 100, maxHp: 100))
        }
        
        boxedScreen(title: "Battle Start", lines: [
            "\(!companions.isEmpty ? "You and your companions " : "You " )are facing \(enemies.count) enemies!",
            "Prepare for battle!"
        ])
        pressEnterToContinue()
        
        while heroes.contains(where: { $0.isAlive() }) &&
                enemies.contains(where: { $0.isAlive() }) {
            
            boxedScreen(title: "Battle Stand", lines: getStatusLines(heroes: heroes, enemies: enemies))
            pressEnterToContinue()
            waitASec(sec: 1)
            
            // MARK: HERO ACTIONS
            for hero in heroes {
                boxedScreen(title: "Your Turn, \(hero.name)", lines: [
                    "Choose action:",
                    "",
                    "(1) ➤ Attack",
                    "\(hero is Warrior ? "(2) ➤ Power Strike" : hero is Magician ? "(2) ➤ Cast Fireball" : "(2) ➤ Mass Heal")",
                    "",
                    "(b) ➤ Open bag",
                    "(q) ➤ Quit game"
                ])
                print("Enter [1] for attack, [2] for special attack, (b) ➤ Open bag, (q) ➤ Quit game: ", terminator: "")
                
                if let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                    if input.lowercased() == "b" {
                        player.bag.menu(currentHero: player)
                        continue
                    } else if input.lowercased() == "q" {
                        print("You decided to quit the game. Goodbye! ", terminator: "")
                        waitASec(sec: 1.5)
                        return
                    } else if input == "1" {
                        let livingEnemies = enemies.enumerated().filter { $0.element.isAlive() }
                        let enemyLines = livingEnemies.map { "(\($0.offset + 1)) ➤ \($0.element.name) (HP: \($0.element.hp))" }
                        boxedScreen(title: "Choose Enemy", lines: enemyLines)
                        print("Enter [number] for choose enemy, (q) ➤ Quit game: ", terminator: "")
                        
                        if let input = readLine(), let inputNumber = Int(input),
                           inputNumber >= 1 && inputNumber <= livingEnemies.count {
                            let index = inputNumber - 1
                            let target = livingEnemies[index].element
                            hero.attack(target: target)
                            pressEnterToContinue()
                        } else if input.lowercased() == "q" {
                            print("You decided to quit the game. Goodbye! ", terminator: "")
                            waitASec(sec: 1.5)
                            return
                        } else {
                            print("Invalid input. Please try again: ", terminator: "")
                            waitASec(sec: 1)
                        }
                    } else if input == "2" {
                        let livingEnemiesWithIndex = enemies.enumerated().filter { $0.element.isAlive() }
                        let livingEnemies = livingEnemiesWithIndex.map { $0.element }

                        let livingHeroesWithIndex = heroes.enumerated().filter { $0.element.isAlive() }
                        let livingHeroes = livingHeroesWithIndex.map { $0.element }
                        
                        let enemyLines = livingEnemiesWithIndex.map { "(\($0.offset + 1)) ➤ \($0.element.name) (HP: \($0.element.hp))" }
                        boxedScreen(title: "Choose Enemy", lines: enemyLines)
                        print("Enter [number] for choose enemy, (q) ➤ Quit game: ", terminator: "")
                        
                        if let input = readLine(), let inputNumber = Int(input),
                           inputNumber >= 1 && inputNumber <= livingEnemies.count {
                            let index = inputNumber - 1
                            let target = livingEnemiesWithIndex[index].element
                            switch hero {
                            case let warrior as Warrior:
                                warrior.powerStrike(target: target)
                            case let magician as Magician:
                                magician.castFireball(enemies: livingEnemies)
                            case let cleric as Cleric:
                                cleric.massHeal(heroes: livingHeroes)
                            default:
                                break
                            }
                       
                            player.attack(target: target)
                            pressEnterToContinue()
                        } else if input.lowercased() == "q" {
                            print("You decided to quit the game. Goodbye! ", terminator: "")
                            waitASec(sec: 1.5)
                            return
                        } else {
                            print("Invalid input. Please try again: ", terminator: "")
                            waitASec(sec: 1)
                        }
                    } else {
                        print("Invalid input. Please try again: ", terminator: "")
                        waitASec(sec: 1)
                    }
                }
            }
            
            
            boxedScreen(title: "After Allies Turn", lines: getStatusLines(heroes: heroes, enemies: enemies))
            pressEnterToContinue()
            waitASec(sec: 1)
            
            // MARK: ENEMY ACTIONS
            for enemy in enemies where enemy.isAlive() {
                if let target = heroes.first(where: { $0.isAlive() }) {
                    boxedScreen(title: "\(enemy.name)'s Turn", lines: [
                        "\(enemy.name) attacks \(target.name)!"
                    ])
                    enemy.attack(target: target)
                    pressEnterToContinue()
                }
            }
            
            
            boxedScreen(title: "After Enemy Turn", lines: getStatusLines(heroes: heroes, enemies: enemies))
            pressEnterToContinue()
        }
        if heroes.contains(where: { $0.isAlive() }) {
            // Helden leben noch → Sieg
            boxedScreen(title: "Victory!", lines: ["You have defeated all enemies."])
            return
        } else {
            boxedScreen(title: "Defeat!", lines: ["Your party has fallen in battle."])
            exit(0)
        }
    }
    
    func getStatusLines(heroes: [Hero], enemies: [Enemy]) -> [String] {
        var lines: [String] = []
        lines.append("== Your Party ==")
        for hero in heroes {
            lines.append("\(hero.name): \(hero.hp)/\(hero.maxHp) HP")
        }
        lines.append("")
        lines.append("== Enemies ==")
        for enemy in enemies {
            lines.append("\(enemy.name): \(enemy.hp)/\(enemy.maxHp) HP")
        }
        return lines
    }
}
