//
//  Game.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation


class Game {
    var player: Hero?
    var heroes: [Hero] = []
    var enemies: [Enemy] = []
    var roundCounter: Int = 0
    var minionsSpawned: Bool = false
    var difficulty: Difficulty?
    
//    init(heroes: [Hero], enemies: [Enemy], roundCounter: Int, minionsSpawned: Bool) {
//        self.heroes = heroes
//        self.enemies = enemies
//        self.roundCounter = roundCounter
//        self.minionsSpawned = minionsSpawned
//    }
    
    func start() {
        clearScreen()
        roundCounter = 1
        minionsSpawned = false
        initGame()
        switch difficulty {
        case .easy:
            return
        case .medium:
            return
        case .hard:
            return
        case nil:
            return
        }
    }
    
    // Todo start()
    // - Start Screen (Game name and so on...) ✅
    // - Init Screen (set which Hero you want to be and how many heroes are there and it will be created an instance after your wishes) ✅
    // - Other Heroes Screen (set how many heroes are there and it will be created an instance after your wishes) ✅
    // - Story Screen (set which type of Story you want to play (easy, middle, hard) ✅
    // - Summary Screen (shows the summary of which was choosed (Hero for yourself. Hero KI and which Story) ✅
    
    
    // ToDo Difficulty funcs
    // -
    

    func initGame() {
        startScreen()
        chooseHero()
        setCompanions()
        difficulty = setDifficultyLevel()
        guard let player = player else { return }
        guard let difficulty = difficulty else { return }
        initSummaryScreen(player: player, companions: heroes, difficulty: difficulty)
    }
    
    func round() {
        boxedScreen(title: "Round \(roundCounter)", lines: ["Round \(roundCounter) is running..."])
        pressEnterToContinue()
        
        printStatus()

        // MARK: HERO ACTIONS
        // Not the yellow from the egg....
        heroes.forEach { hero in
            if let targetEnemy = enemies.randomElement() {
                hero.attack(target: targetEnemy)
            }
        }
        
        // MARK: ENEMY ACTIONS
        // Also nit the yellow from the egg...
        enemies.forEach { enemy in
            if let targetHero = heroes.randomElement() {
                enemy.attack(target: targetHero)
            }
        }
        
        enemies.removeAll { $0.hp <= 0 }
        heroes.removeAll { $0.hp <= 0 }
        
        roundCounter += 1
    }
    
    func printStatus() {
        var lines: [String] = []
        
        lines.append("Round: \(roundCounter)")
        lines.append("Minions spawned: \(minionsSpawned ? "Yes" : "No")")
        lines.append("")
        lines.append("Heroes:")
        
        if heroes.isEmpty {
            lines.append("No heroes in the game.")
        } else {
            heroes.forEach {
                lines.append(" \($0.name) - HP: \($0.hp)")
            }
            
            lines.append("")
            lines.append("Enemies:")
            if enemies.isEmpty {
                lines.append(" No enemies in the game.")
            } else {
                for enemy in enemies {
                    lines.append(" \(enemy.name) - HP: \(enemy.hp)")
                }
            }
            
            boxedScreen(title: "Game status", lines: lines)
            pressEnterToContinue()
            waitASec(sec: 1)
        }
    }
    
    func checkGameOver() -> Bool {
        let gameOver = heroes.isEmpty || enemies.isEmpty
        if gameOver {
            let winner = heroes.isEmpty ? "The Enemies" : "The Heroes"
            boxedScreen(title: "End", lines: ["\(winner) won!"])
            pressEnterToContinue()
            waitASec(sec: 1)
        }
        return gameOver
    }
    
    func addMinionIfNeeded() {
        if !minionsSpawned {
            minionsSpawned = true
            enemies.append(Minion(name: "Minion", hp: 10))
            boxedScreen(title: "Minions", lines: ["Minion has been added!"])
            waitASec(sec: 2.5)
        }
    }
    
    // MARK: METHODS FOR GAME INIT
    
    func startScreen() {
        let title = [
            "",
            "",
            "",
            "",
            "",
            "💥 LEGENDS OF SWIFTIA 💥",
            "",
            "",
            "",
            "",
            "👉 PRESS ENTER TO START THE GAME 👈"
        ]

        boxedScreen(title: "Start Screen", lines: title)
        pressEnterToContinue()
        waitASec(sec: 2)
    }
    
    func chooseHero() {
        let availableHeroes = [
            Warrior(shield: 50, bag: Bag(), name: "Warrior", hp: 100, maxHp: 100),
            Magician(mana: 50, bag: Bag(), name: "Magician", hp: 80, maxHp: 80),
            Cleric(holyPower: 50, bag: Bag(), name: "Cleric", hp: 60, maxHp: 60)
        ]

        let heroDescriptions = [
            "Tell us who you are...",
            "",
            "(1) 🛡️ Warrior - High life, balanced damage",
            "(2) 🔮 Magician - Fragile, powerful spells",
            "(3) ✨ Healer - Supports all, low attack"
        ]

        boxedScreen(
            title: "Choose your hero",
            lines: heroDescriptions
        )
        print("Enter [1], [2] or [3] to choose your hero: ", terminator: "")
        waitASec(sec: 1)

        var selectedHero: Hero?

        while selectedHero == nil {
            if let input = readLine(), let choice = Int(input), (1...3).contains(choice) {
                selectedHero = availableHeroes[choice - 1]
            } else {
                print("❌ Invalid input. Please enter 1, 2 or 3.")
            }
        }

        if let hero = selectedHero {
                heroes.append(hero)
                player = hero
                
                let descriptionLines: [String]
                
                switch hero.name {
                case "Warrior":
                    descriptionLines = [
                        "You have chosen the Warrior!",
                        "",
                        "Clad in steel and driven by honor,",
                        "the Warrior stands as a bulwark between",
                        "his allies and the encroaching darkness.",
                        "With sword and shield, he holds the line."
                    ]
                case "Magician":
                    descriptionLines = [
                        "You have chosen the Magician!",
                        "",
                        "Wielding arcane forces beyond mortal grasp,",
                        "the Magician rains destruction from afar.",
                        "But beware—power comes at the cost of frailty."
                    ]
                case "Cleric":
                    descriptionLines = [
                        "You have chosen the Healer!",
                        "",
                        "A beacon of light in times of despair,",
                        "the Healer calls upon sacred energy",
                        "to mend wounds and turn tides with grace."
                    ]
                default:
                    descriptionLines = ["You play as \(hero.name)!"]
                }

                boxedScreen(title: "Hero selected", lines: descriptionLines)
                pressEnterToContinue()
                waitASec(sec: 1)
            }
    }
    
    func setCompanions() {
        guard let player = player else { return }
        boxedScreen(
            title: "Choose your companions",
            lines: ["\(player.name), up to two brave souls may walk beside you...", "...choose your companions wisely!"]
        )
        print("Enter a number between 0 and 2: ", terminator: "")
        waitASec(sec: 1)

        var numberOfCompanions: Int? = nil
        while numberOfCompanions == nil {
            if let input = readLine(), let num = Int(input), (0...2).contains(num) {
                numberOfCompanions = num
            } else {
                print("❌ Invalid input. Please enter 0, 1 or 2: ", terminator: "")
            }
        }
        
        let confirmationText: String
        switch numberOfCompanions {
        case 0:
            confirmationText = "You chose to walk this path alone. A bold decision."
        case 1:
            confirmationText = "You chose to be accompanied by 1 companion. Strength in unity."
        case 2:
            confirmationText = "You chose 2 companions to aid you. A well-balanced fellowship."
        default:
            fatalError("Unexpected number of companions: \(numberOfCompanions!)")
        }

        boxedScreen(
            title: "Confirmation",
            lines: [confirmationText]
        )
        pressEnterToContinue()
        waitASec(sec: 1)
    
        let baseCompanionDescription = [
            "",
            "",
            "(1) 🛡️ Warrior - Lots of health, moderate damage",
            "(2) 🔮 Magician - Low health, high damage",
            "(3) ✨ Healer - Supports the team, low damage"
        ]

        let companionIntroLines = [
            "Which soul shall walk beside you into the unknown?",
            "And who shall be the second to brave the darkness?"
        ]
        
        var companionsSelected: [Hero] = []
        
        for i in 1...numberOfCompanions! {
            var description = baseCompanionDescription
            description[0] = companionIntroLines[i - 1] // Zeile 0 ersetzen
            
            boxedScreen(
                title: "Select Companion \(i)",
                lines: description
            )
            
            print("Choose type for companion \(i) (1 - 3): ", terminator: "")
            
            var selectedCompanion: Hero? = nil
            while selectedCompanion == nil {
                if let input = readLine(), let choice = Int(input), (1...3).contains(choice) {
                    switch choice {
                    case 1:
                        selectedCompanion = Warrior(
                            shield: 50,
                            bag: Bag(),
                            name: "Warrior Companion \(i)",
                            hp: 100,
                            maxHp: 100
                        )
                    case 2:
                        selectedCompanion = Magician(
                            mana: 50,
                            bag: Bag(),
                            name: "Magician Companion \(i)",
                            hp: 80,
                            maxHp: 80
                        )
                    case 3:
                        selectedCompanion = Cleric(
                            holyPower: 50,
                            bag: Bag(),
                            name: "Cleric Companion \(i)",
                            hp: 60,
                            maxHp: 60
                        )
                    default:
                        break
                    }
                } else {
                    print("❌ Invalid input. Please enter 1, 2 or 3: ", terminator: "")
                }
            }
            companionsSelected.append(selectedCompanion!)
            print("Companion \(i): \(selectedCompanion!.name) selected.")
        }
        
        var summaryLines = ["You have the following companions on your journey:"]
        if companionsSelected.isEmpty {
            summaryLines.append("No companions selected.")
        } else {
            for companion in companionsSelected {
                summaryLines.append("- \(companion.name) (HP: \(companion.hp))")
            }
        }
        heroes.append(contentsOf: companionsSelected)
        boxedScreen(title: "Companions Summary", lines: summaryLines)
        pressEnterToContinue()
        waitASec(sec: 1)
    }
    
    func setDifficultyLevel() -> Difficulty {
        let difficultyDescriptions = [
            "(1) 🌿 Emerald Grove - A bright and welcoming forest. (Easy)",
            "(2) 🌫️ Twilight Thicket - Shadows linger here. (Medium)",
            "(3) 🌑 Whispering Abyss - Only the brave dare enter. (Hard)"
        ]
        
        boxedScreen(
            title: "Choose Your Path",
            lines: [
                "Three paths lie before you, each darker than the last.",
                "",
            ] + difficultyDescriptions
        )
        print("Enter difficulty (1 - 3): ", terminator: "")
        waitASec(sec: 1)
        
        while true {
            if let input = readLine(), let choice = Int(input), (1...3).contains(choice) {
                switch choice {
                case 1:
                    boxedScreen(
                        title: "🌿 Emerald Grove",
                        lines: [
                            "The trees sway gently in the wind, their leaves glowing with morning dew.",
                            "A place of hope — but danger may still lurk in the shadows..."
                        ]
                    )
                    pressEnterToContinue()
                    waitASec(sec: 2)
                    return .easy
                case 2:
                    boxedScreen(
                        title: "🌫️ Twilight Thicket",
                        lines: [
                            "A faint fog lies between the gnarled roots and crooked trunks.",
                            "Every step echoes as if watched by unseen eyes..."
                        ]
                    )
                    pressEnterToContinue()
                    waitASec(sec: 2)
                    return .medium
                case 3:
                    boxedScreen(
                        title: "🌑 Whispering Abyss",
                        lines: [
                            "The forest here is silent — too silent. No birds. No wind.",
                            "You hear whispers that vanish when you try to listen."
                        ]
                    )
                    pressEnterToContinue()
                    waitASec(sec: 2)
                    return .hard
                default:
                    break
                }
            }
            print("❌ Invalid input. Please enter 1, 2 or 3: ", terminator: "")
        }
    }

    func initSummaryScreen(player: Hero, companions: [Hero], difficulty: Difficulty) {
        var lines: [String] = []
        
        // Spieler Info
        lines += ["", "You are the: `\(player.name)`", ""]

        
        // Begleiter Info
        if companions.isEmpty {
            lines += ["", "You have no companions."]
        } else {
            lines += ["", "Your companions: ", ""]
            for companion in companions {
                lines.append("- \(companion.name)")
            }
        }
        lines.append("")
        
        // Schwierigkeit
        lines.append("Difficulty level: \(difficulty)")
        
        boxedScreen(title: "Game Summary", lines: lines)
        pressEnterToContinue()
        waitASec(sec: 2)
    }

    
    
}
