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
            "(1) 🛡️ Warrior - Lots of life, moderate damage",
            "(2) 🔮 Magician - Low life, high damage",
            "(3) ✨ Healer - Supports the team, low damage"
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
            boxedScreen(title: "Hero selected", lines: ["You play as \(hero.name)!"])
            pressEnterToContinue()
        }
    }
    
    func companions() {
        
    }
}
