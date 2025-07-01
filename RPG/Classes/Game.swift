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
    var roundCounter: Int
    var minionsSpawned: Bool = false
    
    init(heroes: [Hero], enemies: [Enemy], roundCounter: Int, minionsSpawned: Bool) {
        self.heroes = heroes
        self.enemies = enemies
        self.roundCounter = roundCounter
        self.minionsSpawned = minionsSpawned
    }
    
    func start() {
        clearScreen()
        roundCounter = 1
        minionsSpawned = false
//        boxedScreen(title: "Game start", lines: ["The game starts!", "Round \(roundCounter) starts."])
        initGame()
//        pressEnterToContinue()
    }
    
    // Todo start()
    // - Start Screen (Game name and so on...) ✅
    // - Init Screen (set which Hero you want to be and how many heroes are there and it will be created an instance after your wishes) ✅
    // - Other Heroes Screen (set how many heroes are there and it will be created an instance after your wishes)
    // - Story Screen (set which type of Story you want to play (easy, middle, hard)
    // - Summary Screen (shows the summary of which was choosed (Hero for yourself. Hero KI and which Story)
    // -

    func initGame() {
        startScreen()
        chooseHero()
        
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
        }
        
        func checkGameOver() -> Bool {
            let gameOver = heroes.isEmpty || enemies.isEmpty
            if gameOver {
                let winner = heroes.isEmpty ? "The Enemies" : "The Heroes"
                boxedScreen(title: "End", lines: ["\(winner) won!"])
                pressEnterToContinue()
            }
            return gameOver
        }
        
        func addMinionIfNeeded() {
            if !minionsSpawned {
                minionsSpawned = true
                enemies.append(Minion(name: "Minion", hp: 10))
                boxedScreen(title: "Minions", lines: ["Minion has been added!"])
                waitABit(sec: 2.5)
            }
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
            }
    }
    
    func setCompanions() {
        guard let player = player else { return }
        boxedScreen(
            title: "Choose your companions",
            lines: ["\(player.name), How many companions will accompany you on your journey?", "You can take up to 2 companions with you on your journey. Choose wisely."]
        )
        print("Enter a number between 0 and 2: ", terminator: "")
        // HIER BIN ICH STEHEN GEBLIEBEN
        var numberOfCompanions: Int? = nil
        while numberOfCompanions == nil {
            if let input = readLine(), let num = Int(input), (0...2).contains(num) {
                numberOfCompanions = num
            } else {
                print("❌ Invalid input. Please enter 0, 1 or 2: ", terminator: "")
            }
        }
        
        // 2. Confirmation screen
        boxedScreen(
            title: "Confirmation",
            lines: ["You chose to have \(numberOfCompanions!) companions."]
        )
        print("Press ENTER to continue...")
        _ = readLine()
        
        // 3. Choose types for companions
        let companionTypes = [
            Warrior(shield: 50, bag: Bag(), name: "Warrior", hp: 100, maxHp: 100),
            Magician(mana: 50, bag: Bag(), name: "Magician", hp: 80, maxHp: 80),
            Cleric(holyPower: 50, bag: Bag(), name: "Cleric", hp: 60, maxHp: 60)
        ]
        
        let companionDescriptions = [
            "(1) 🛡️ Warrior - Lots of health, moderate damage",
            "(2) 🔮 Magician - Low health, high damage",
            "(3) ✨ Healer - Supports the team, low damage"
        ]
        
        var companionsSelected: [Hero] = []
        
        for i in 1...numberOfCompanions! {
            boxedScreen(
                title: "Select Companion \(i)",
                lines: companionDescriptions
            )
            print("Choose type for companion \(i) (1-3): ", terminator: "")
            
            var selectedCompanion: Hero? = nil
            while selectedCompanion == nil {
                if let input = readLine(), let choice = Int(input), (1...3).contains(choice) {
                    let baseHero = companionTypes[choice - 1]
                    let companionName = "\(baseHero.name) \(i+1)"
                    
                    if let warrior = baseHero as? Warrior {
                        selectedCompanion = Warrior(shield: warrior.shield, bag: Bag(), name: companionName, hp: warrior.hp, maxHp: warrior.maxHp)
                    } else if let magician = baseHero as? Magician {
                        selectedCompanion = Magician(mana: magician.mana, bag: Bag(), name: companionName, hp: magician.hp, maxHp: magician.maxHp)
                    } else if let cleric = baseHero as? Cleric {
                        selectedCompanion = Cleric(holyPower: cleric.holyPower, bag: Bag(), name: companionName, hp: cleric.hp, maxHp: cleric.maxHp)
                    }
                } else {
                    print("❌ Invalid input. Please enter 1, 2 or 3: ", terminator: "")
                }
            }
            companionsSelected.append(selectedCompanion!)
            print("Companion \(i): \(selectedCompanion!.name) selected.")
        }
        
        // 4. Summary screen
        var summaryLines = ["You have the following companions on your journey:"]
        if companionsSelected.isEmpty {
            summaryLines.append("No companions selected.")
        } else {
            for companion in companionsSelected {
                summaryLines.append("- \(companion.name) (HP: \(companion.hp))")
            }
        }
        
        boxedScreen(title: "Companions Summary", lines: summaryLines)
        print("Press ENTER to continue...")
        _ = readLine()
        
        // Add companions to heroes list
        heroes.append(contentsOf: companionsSelected)
    }

}
