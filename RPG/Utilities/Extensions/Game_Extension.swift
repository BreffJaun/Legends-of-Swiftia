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
            // STEP 1
            StoryStep(
                title: "Step 1: Forest Edge",
                descriptionLines: [
                    "You stand at the entrance of the Emerald Grove.",
                    "Birdsong fades as thick vines line the path ahead.",
                    "Something unnatural clings to the air."
                ],
                choices: [
                    // FIGHT
                    Choice(
                        description: ["Approach the rustling bushes"],
                        effect: {
                            return self.fight(heroes: self.heroes, minions: 2)
                        },
                        consequenceText: [
                            "As you step closer, two twisted rootlings leap out!",
                            "Their wooden claws slash through the air — fight!"
                        ]
                    ),
                    // ITEM
                    Choice(
                        description: ["Search the old satchel hanging on a tree"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Cracked Acorn", health: 5, damage: 0, defense: 2, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "Inside are dried rations and a few cracked acorns.",
                            "Each companion takes one and pockets it cautiously."
                        ]
                    ),
                    // STATUS
                    Choice(
                        description: ["Smell the glowing fungus nearby"],
                        effect: {
                            for hero in self.heroes {
                                let poison = StatusEffect(type: .poison, duration: 3)
                                hero.applyStatus(status: poison)
                            }
                            return true
                        },
                        consequenceText: [
                            "The sweet scent turns bitter in your lungs.",
                            "A sickly feeling creeps in — you've been poisoned."
                        ]
                    ),
                    // HARMLESS
                    Choice(
                        description: ["Sit on the mossy rock to rest a moment"],
                        effect: { return true },
                        consequenceText: [
                            "You sit in silence, the forest watching.",
                            "Nothing stirs—perhaps a moment of peace."
                        ]
                    )
                ]
            ),
            
            // TRANSITION SCENE 1
            StoryStep(
                title: "Transition: Deeper into the Forest",
                descriptionLines: [
                    "The sounds of the forest edge begin to fade.",
                    "Only the crunching of twigs underfoot remains.",
                    "The trees grow denser, the air heavier — you continue onward."
                ],
                choices: [
                    Choice(
                        description: ["Keep walking..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 2
            StoryStep(
                title: "Step 2: Overgrown Path",
                descriptionLines: [
                    "The trail narrows beneath entangled branches.",
                    "A strange hum rises with each step you take.",
                    "It’s like the forest itself is breathing."
                ],
                choices: [
                    // HARMLOS
                    Choice(
                        description: ["Carefully follow the footprints ahead"],
                        effect: { return true },
                        consequenceText: [
                            "The path remains clear—for now.",
                            "You press onward, undisturbed."
                        ]
                    ),
                    // ITEM
                    Choice(
                        description: ["Examine the bones beneath the ivy"],
                        effect: {
                            if let hero = self.heroes.randomElement() {
                                hero.bag.items.append(Item(name: "Ancient Talisman", health: 0, damage: 0, defense: 5, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "Among the remains you find a glowing talisman.",
                            "One companion claims it for protection."
                        ]
                    ),
                    // STATUS
                    Choice(
                        description: ["Whisper back at the forest hum"],
                        effect: {
                            if let hero = self.heroes.randomElement() {
                                let curse = StatusEffect(type: .curse, duration: 3)
                                hero.applyStatus(status: curse)
                            }
                            return true
                        },
                        consequenceText: [
                            "The forest answers in a voice not your own.",
                            "A chill grips your ally’s soul—they are cursed."
                        ]
                    ),
                    // FIGHT
                    Choice(
                        description: ["Clear the thick vines blocking your way"],
                        effect: {
                            return self.fight(heroes: self.heroes, minions: 3)
                        },
                        consequenceText: [
                            "As you cut through, thornlings burst from the thicket!",
                            "They snarl in rage—battle is upon you."
                        ]
                    )
                ]
            ),
            // TRANSITION SCENE 2
            StoryStep(
                title: "Transition: Whispering Leaves",
                descriptionLines: [
                    "A cold breeze whispers through the leaves above.",
                    "It carries faint murmurs — perhaps voices, perhaps wind.",
                    "You press on, alert and silent."
                ],
                choices: [
                    Choice(
                        description: ["Stay focused and move on..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 3
            StoryStep(
                title: "Step 3: Whispering Clearing",
                descriptionLines: [
                    "You enter a misty glade where the air is unnaturally cold.",
                    "Voices seem to echo, though no one speaks."
                ],
                choices: [
                    // ITEM
                    Choice(
                        description: ["Inspect the altar covered in vines"],
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Wisp Essence", health: 0, damage: 15, defense: 0, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "You carefully collect glowing wisp essence.",
                            "Its power hums faintly in your pack."
                        ]
                    ),
                    // HARMLOS
                    Choice(
                        description: ["Sit in silence and listen"],
                        effect: { return true },
                        consequenceText: [
                            "The forest sighs around you.",
                            "Nothing stirs but the wind."
                        ]
                    ),
                    // FIGHT
                    Choice(
                        description: ["Call out to the voices"],
                        effect: {
                            return self.fight(heroes: self.heroes, minions: 2)
                        },
                        consequenceText: [
                            "Phantom shades emerge, cloaked in fog!",
                            "You draw your weapons instinctively."
                        ]
                    ),
                    // STATUS
                    Choice(
                        description: ["Touch the pool of still water"],
                        effect: {
                            for hero in self.heroes {
                                let freeze = StatusEffect(type: .curse, duration: 2)
                                hero.applyStatus(status: freeze)
                            }
                            return true
                        },
                        consequenceText: [
                            "Your limbs go numb as the water flashes cold.",
                            "You're frozen in dread—temporarily immobilized."
                        ]
                    )
                ]
            ),
            // TRANSITION SCENE 3
            StoryStep(
                title: "Transition: Moss-Covered Paths",
                descriptionLines: [
                    "The path is now lined with thick moss and gnarled roots.",
                    "Every step feels uncertain, the ground soft and damp.",
                    "No turning back now."
                ],
                choices: [
                    Choice(
                        description: ["Continue forward..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 4
            StoryStep(
                title: "Step 4: Twisted Roots",
                descriptionLines: [
                    "The ground is cracked and roots pulse with unnatural energy.",
                    "Darkness coils in the soil beneath your boots."
                ],
                choices: [
                    // STATUS
                    Choice(
                        description: ["Place your hand on a pulsing root"],
                        effect: {
                            for hero in self.heroes {
                                let paralyze = StatusEffect(type: .paralyze, duration: 3)
                                hero.applyStatus(status: paralyze)
                            }
                            return true
                        },
                        consequenceText: [
                            "A surge of energy locks your muscles in place.",
                            "Your bodies resist movement—you are paralyzed."
                        ]
                    ),
                    // ITEM
                    Choice(
                        description: ["Examine the glowing cocoon in the roots"],
                        effect: {
                            if let hero = self.heroes.randomElement() {
                                hero.bag.items.append(Item(name: "Spider Silk Wrap", health: 10, damage: 0, defense: 3, usesLeft: 1))
                            }
                            return true
                        },
                        consequenceText: [
                            "Inside lies a glistening wrap of magical silk.",
                            "It might provide comfort—or entrapment."
                        ]
                    ),
                    // FIGHT
                    Choice(
                        description: ["Tread near the cracked earth"],
                        effect: {
                            return self.fight(heroes: self.heroes, minions: 4)
                        },
                        consequenceText: [
                            "Burrowers erupt from the cracks, howling hungrily!",
                            "They are fast—you must react quickly!"
                        ]
                    ),
                    // HARMLOS
                    Choice(
                        description: ["Step carefully around the roots"],
                        effect: { return true },
                        consequenceText: [
                            "You avoid the shifting tendrils and move forward unharmed.",
                            "Best not to disturb what lies below."
                        ]
                    )
                ]
            ),
            // TRANSITION SCENE 4
            StoryStep(
                title: "Transition: The Heart of the Grove",
                descriptionLines: [
                    "Faint green light filters through the canopy.",
                    "The silence is almost sacred here, broken only by your breath.",
                    "Something ancient watches from the shadows."
                ],
                choices: [
                    Choice(
                        description: ["Step deeper into the grove..."],
                        effect: { return true },
                        consequenceText: []
                    )
                ]
            ),

            // STEP 5
            // STEP 5: Duc & Dukas – Boss Enemies
            StoryStep(
                title: "Step 5: Duc & Dukas – Keepers of the Confused",
                descriptionLines: [
                    "The ground trembles beneath your feet.",
                    "Two massive figures break through the underbrush.",
                    "\"I am Duc...\" growls one. \"...and I am Dukas,\" finishes the other.",
                    "\"You have gone too far!\""
                ],
                choices: [
                    Choice(
                        description: ["Face Duc & Dukas in a battle!"],
                        effect: {
//                            return self.fight(heroes: self.heroes, minions: 4)
                            let duc = Minion(name: "Duc", hp: 60)
                            let dukas = Minion(name: "Dukas", hp: 60)
                            return self.fight(heroes: self.heroes, minions: 0, presetEnemies: [duc, dukas])
                        },
                        consequenceText: [
                            "Duc raises his stone club and roars angrily",
                            "and Dukas slams the ground with thunderous force.",
                            "A fierce battle erupts!"
                        ]
                    ),
                ]
            ),

            // STEP 6: Transition – Epilogue
            StoryStep(
                title: "Transition: Sunbeams through the Mist",
                descriptionLines: [
                    "Duc and Dukas finally fall heavily to the ground.",
                    "The forest breathes a sigh of relief — silence returns.",
                    "A last sunbeam breaks through the branches, warming your faces.",
                    "",
                    "Relief floods through you.",
                    "You have survived — and triumphed."
                ],
                choices: [
                    Choice(
                        description: ["Leave the forest in peace"],
                        effect: {
                            print("The heroes step out of the forest’s shadow into a new day.")
                            return true
                        },
                        consequenceText: []
                    )
                ]
            )

            
            
//            StoryStep(
//                title: "Step 5: Forgotten Shrine",
//                descriptionLines: [
//                    "An ancient shrine looms in a clearing.",
//                    "Strange symbols glow faintly along its stones.",
//                    "You feel watched, yet welcomed."
//                ],
//                choices: [
//                    // HARMLOS
//                    Choice(
//                        description: ["Sit peacefully among the shrine stones"],
//                        effect: { return true },
//                        consequenceText: [
//                            "Time passes slowly, quietly.",
//                            "You feel spiritually centered, untouched by harm."
//                        ]
//                    ),
//                    // STATUS
//                    Choice(
//                        description: ["Trace the runes with your fingers"],
//                        effect: {
//                            if let hero = self.heroes.randomElement() {
//                                let burn = StatusEffect(type: .burn, duration: 3)
//                                hero.applyStatus(status: burn)
//                            }
//                            return true
//                        },
//                        consequenceText: [
//                            "The runes flare, burning your skin.",
//                            "One hero bears the mark—cursed with burning pain."
//                        ]
//                    ),
//                    // ITEM
//                    Choice(
//                        description: ["Offer a prayer at the shrine"],
//                        effect: {
//                            for hero in self.heroes {
//                                hero.bag.items.append(Item(name: "Blessed Stone", health: 0, damage: 0, defense: 7, usesLeft: 1))
//                            }
//                            return true
//                        },
//                        consequenceText: [
//                            "Warmth fills your hearts as a gift appears at your feet.",
//                            "You receive sacred stones imbued with ancient protection."
//                        ]
//                    ),
//                    // FIGHT
//                    Choice(
//                        description: ["Inspect the idol at the shrine's center"],
//                        effect: {
//                            return self.fight(heroes: self.heroes, minions: 3)
//                        },
//                        consequenceText: [
//                            "The idol awakens! Stone guardians emerge from the earth.",
//                            "Your challenge has been accepted."
//                        ]
//                    )
//                ]
//            ),
            
//            StoryStep(
//                title: "Final Step: The Office of Doom",
//                descriptionLines: [
//                    "You enter a dimly lit office filled with stacks of ungraded papers.",
//                    "At the head of the cluttered desk sits Justulor, Warden of Exams.",
//                    "He glares at you with a mix of tiredness and deadly seriousness.",
//                    "Prepare yourself for the ultimate challenge!"
//                ],
//                choices: [
//                    Choice(
//                        description: ["Face Justulor, Warden of Exams, Boss of Eternal Deadlines"],
//                        effect: {
//                            // Hier übergibst du Justus als besonderen Boss
//                            return self.fightBoss(heroes: self.heroes, bossName: "Justulor, Warden of Exams")
//                        },
//                        consequenceText: [
//                            "\"Did you finish the homework?\" Justus growls.",
//                            "You feel the weight of countless missed deadlines pressing down.",
//                            "But victory means passing the course... or at least surviving the lecture!"
//                        ]
//                    )
//                ]
//            )

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
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Healing Potion", health: 20, damage: 0, defense: 0, usesLeft: 1))
                            }
                            return true
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
                        effect: {
                            for hero in self.heroes {
                                hero.bag.items.append(Item(name: "Healing Potion", health: 20, damage: 0, defense: 0, usesLeft: 1))
                            }
                            return true
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
    
    
    func fight(heroes: [Hero], minions: Int, presetEnemies: [Enemy] = []) -> Bool {
        let player = self.heroes[0]
        let companions = self.heroes.dropFirst().filter { $0.isAlive() } // Dropped myself on index 0
        var hasShownBattleStand = false
        
        if minions > 0 {
                for i in 1...minions {
                    self.enemies.append(Minion(name: "Minion \(i)", hp: 30))
                }
            } else if !presetEnemies.isEmpty {
                self.enemies += presetEnemies
            }
                
        boxedScreen(title: "Battle Start", lines: [
            "\(!companions.isEmpty ? "You and your companions " : "You " )are facing \(enemies.count) enemies!",
            "Prepare for battle!"
        ])
        pressEnterToContinue()
        
        
        while self.heroes.contains(where: { $0.isAlive() }) &&
                self.enemies.contains(where: { $0.isAlive() }) {
            
            
            if !hasShownBattleStand {
                boxedScreen(title: "Battle Stand", lines: getStatusLines(heroes: heroes, enemies: enemies))
                pressEnterToContinue()
                waitASec(sec: 1)
                hasShownBattleStand = true
            }
            
            // MARK: HERO ACTIONS
            for hero in self.heroes {
                // Check if there are still enemies, so the other heroes don`t need to make thier round to fight against "nothing"
                if getLivingEnemies().isEmpty {
                    break
                }
                
                boxedScreen(title: "Your Turn, \(hero.name)", lines: [
                    "Choose action:",
                    "",
                    "(1) ➤ Attack",
                    "\(hero is Warrior ? "(2) ➤ Power Strike" : hero is Magician ? "(2) ➤ Cast Fireball" : "(2) ➤ Mass Heal")",
                    "(3) ➤ Recharge \(hero is Warrior ? "endurance" : hero is Magician ? "mana" : "holy power")",
                    "",
                    "(b) ➤ Open bag",
                    "(q) ➤ Quit game"
                ])
                print("Enter [1] ➤ attack, [2] ➤ special attack, (b) ➤ Open bag, (q) ➤ Quit game: ", terminator: "")
                
                if let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                    if input.lowercased() == "b" {
                        hero.bag.menu(currentHero: player)
                        continue
                    } else if input.lowercased() == "q" {
                        print("You decided to quit the game. Goodbye! ", terminator: "")
                        waitASec(sec: 1.5)
                        return false
                    } else if input == "1" {
                        let livingEnemies = self.enemies.enumerated().filter { $0.element.isAlive() }
                        let enemyLines = livingEnemies.map { "(\($0.offset + 1)) ➤ \($0.element.name) (HP: \($0.element.hp))" }
                        boxedScreen(title: "Choose Enemy", lines: enemyLines)
                        print("Enter [number] for choose enemy, (q) ➤ Quit game: ", terminator: "")
                        
                        if let input = readLine(), let inputNumber = Int(input),
                           inputNumber >= 1 && inputNumber <= livingEnemies.count {
                            let index = inputNumber - 1
                            let target = livingEnemies[index].element
                            hero.attack(target: target)
                            if hero is Warrior || hero is Magician || hero is Cleric {
                                hero.normalRecharge()
                            }                            
                            pressEnterToContinue()
                        } else if input.lowercased() == "q" {
                            print("You decided to quit the game. Goodbye! ", terminator: "")
                            waitASec(sec: 1.5)
                            return false
                        } else {
                            print("Invalid input. Please try again: ", terminator: "")
                            waitASec(sec: 1)
                        }
                    } else if input == "2" {
                        // Setting enemies with index (for visual presentation) and without for the code syntax
                        let livingEnemiesWithIndex = self.enemies.enumerated().filter { $0.element.isAlive() }
                        let livingEnemies = self.enemies.filter { $0.isAlive() }

                        // Setting heroes without index because we didn´t need to show them for selection
                        let livingHeroes = self.heroes.filter { $0.isAlive() }
                        
                        switch hero {
                        case let warrior as Warrior:
                            let enemyLines = livingEnemiesWithIndex.map { "(\($0.offset + 1)) ➤ \($0.element.name) (HP: \($0.element.hp))" }
                            boxedScreen(title: "Choose Enemy", lines: enemyLines)
                            print("Enter [number] for choose enemy, (q) ➤ Quit game: ", terminator: "")
                            if let input = readLine(), let inputNumber = Int(input),
                               inputNumber >= 1 && inputNumber <= livingEnemies.count {
                                let index = inputNumber - 1
                                let target = livingEnemiesWithIndex[index].element
                                warrior.powerStrike(target: target)
                            }  else if input.lowercased() == "q" {
                                print("You decided to quit the game. Goodbye! ", terminator: "")
                                waitASec(sec: 1.5)
                                return false
                            } else {
                                print("Invalid input. Please try again: ", terminator: "")
                                waitASec(sec: 1)
                            }
                            pressEnterToContinue()
                        case let magician as Magician:
                            magician.castFireball(enemies: livingEnemies)
                            pressEnterToContinue()
                        case let cleric as Cleric:
                            cleric.massHeal(heroes: livingHeroes)
                            pressEnterToContinue()
                        default:
                            break
                        }
                    } else if input == "3" {
                        hero.skipToRecharge()
                        pressEnterToContinue()
                    } else {
                        print("Invalid input. Please try again: ", terminator: "")
                        waitASec(sec: 1)
                    }
                }
                for hero in self.heroes {
                    hero.processStatusEffects()
                }

                self.heroes = getLivingHeroes()
                self.enemies = getLivingEnemies()
            }
            
            if !self.enemies.isEmpty {
                boxedScreen(title: "After Allies Turn", lines: getStatusLines(heroes: self.heroes, enemies: self.enemies))
                pressEnterToContinue()
                waitASec(sec: 1)
                
                // MARK: ENEMY ACTIONS
                for enemy in self.enemies {
                    if let target = heroes.randomElement() {
                        boxedScreen(title: "\(enemy.name)'s Turn", lines: [
                            "\(enemy.name) attacks \(target.name)!"
                        ])
                        enemy.attack(target: target)
                        pressEnterToContinue()
                    }
                    self.heroes = getLivingHeroes()
                    self.enemies = getLivingEnemies()
                }
                
                if !heroes.isEmpty {
                    boxedScreen(title: "After Enemy Turn", lines: getStatusLines(heroes: self.heroes, enemies: self.enemies))
                    pressEnterToContinue()
                } else {
                    continue
                }
            } else {
                continue
            }
            
        }
        if heroes.contains(where: { $0.isAlive() }) {
            boxedScreen(title: "Victory!", lines: ["You have defeated all enemies."])
            return true // prüfen ob er dann nicht ganz aus dem Spiel geht!
        } else {
            boxedScreen(title: "Defeat!", lines: ["Your party has fallen in battle."])
            exit(0)
//            return false
        }
    }
    
    func getStatusLines(heroes: [Hero], enemies: [Enemy]) -> [String] {
        var lines: [String] = []
        lines += ["-=== Your  Party ===-", ""]
//        for hero in heroes {
//            lines.append("\(hero.name): \(hero.hp)/\(hero.maxHp) HP")
//        }
        
        for hero in heroes {
            if let warrior = hero as? Warrior {
                lines.append("\(warrior.name): \(warrior.hp)/\(warrior.maxHp) HP | \(warrior.endurance)/\(warrior.maxEndurance) EN")
            } else if let magician = hero as? Magician {
                lines.append("\(magician.name): \(magician.hp)/\(magician.maxHp) HP | \(magician.mana)/\(magician.maxMana) MA")
            } else if let cleric = hero as? Cleric {
                lines.append("\(cleric.name): \(cleric.hp)/\(cleric.maxHp) HP | \(cleric.holyPower)/\(cleric.maxHolyPower) HO")
            } else {
                lines.append("\(hero.name): \(hero.hp)/\(hero.maxHp) HP | --/??")
            }
        }

        lines += ["", "---------------------", "", "-===   Enemies   ===-", ""]
        for enemy in enemies {
            if let minion = enemy as? Minion {
                lines.append("\(minion.name): \(minion.hp)/\(minion.maxHp) HP | \(minion.endurance)/\(minion.maxEndurance) EN")
            } else if let boss = enemy as? Boss {
                lines.append("\(boss.name): \(boss.hp)/\(boss.maxHp) HP | \(boss.endurance)/\(boss.maxEndurance) EN | \(boss.mana)/\(boss.maxMana) MA")
            }
        }
        return lines
    }
    
    func getLivingEnemies() -> [Enemy] {
        return enemies.filter { $0.isAlive() }
    }
    
    func getLivingHeroes() -> [Hero] {
        return heroes.filter { $0.isAlive() }
    }
    
    func randomStatusEffect() -> StatusEffectType {
        let statusEffects: [StatusEffectType] = [.poison, .paralyze, .burn, .freeze, .curse]
        return statusEffects.randomElement()!
   }
}
