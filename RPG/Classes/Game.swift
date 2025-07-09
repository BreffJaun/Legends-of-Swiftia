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
    
    func initGame() {
        chooseHero()
        setCompanions()
        difficulty = setDifficultyLevel()
        guard let player = player else { return }
        guard let difficulty = difficulty else { return }
        initSummaryScreen(player: player, companions: heroes, difficulty: difficulty)
    }
    
    func start() {
        clearScreen()
        roundCounter = 1
        minionsSpawned = false
//        playSound(path: menuSound, loops: -1, volume: 0.005)
        startScreen()
        
        while true {
            playSound(path: menuSound, loops: -1, volume: 0.005)
            menu()
            
            let storySteps: [StoryStep]
            switch difficulty {
            case .easy:
                storySteps = easyStorySteps()
            case .medium:
                return
        //      storySteps = normalStorySteps
            case .hard:
                return
        //      storySteps = hardStorySteps
            case nil:
                return
            }

            for step in storySteps {
                checkGamePlayMusic()
                let shouldContinue = round(step: step)
                if !shouldContinue {
                    break 
                }
//                pressEnterToContinue()
            }
            playSound(path: winSound)
            resetSettings()
            boxedScreen(title: "Legends of Swiftia", lines: [
                "You have conquered darkness and restored peace.",
                "Swiftia shall never forget your name.",
                "",
                "Thank you for playing!"
            ])
            waitASec(sec: 4)
        }
    }
    
    
    func round(step: StoryStep) -> Bool {
        guard let player = player else { return false }
        if step.choices[0].consequenceText.isEmpty {
            let meaningfulLines = step.descriptionLines.filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
               if !meaningfulLines.isEmpty {
                   boxedScreen(title: step.title, lines: meaningfulLines)
               }
               return true
        }
        
        var selectedIndex: Int?
        repeat {
            clearScreen()
            var choiceTexts = step.choices.enumerated().map { (i, choice) in
                "(\(i + 1)) ➤ \(choice.description[0])"
            }
            
            choiceTexts += ["", "(b) ➤ Open bag", "(q) ➤ Quit game"]

            let fullText = step.descriptionLines + [""] + choiceTexts
            
            boxedScreen(title: step.title, lines: fullText)
            print("Enter [1], [2], [3], [4] for a choice, [b] Open bag, (q) ➤ Quit game: ", terminator: "")
            waitASec(sec: 1)
                    
        
            if let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                if input.lowercased() == "b" {
                    playSound(path: openBagSound)
                    player.bag.menu(currentHero: player)
                    continue
                } else if input.lowercased() == "q" {
                    print("You decided to quit the game. Goodbye! ", terminator: "")
                    waitASec(sec: 1.5)
                    return false
                } else if let number = Int(input), (1...step.choices.count).contains(number) {
                    selectedIndex = number - 1
                } else {
                    print("Invalid input. Please try again: ", terminator: "")
                    waitASec(sec: 1)
                }
            }
            let heroesWithEffects = heroes.filter { !$0.statusEffects.isEmpty }

            for hero in heroesWithEffects {
                hero.processStatusEffects()
                waitASec(sec: 0.75)
            }

            if !heroesWithEffects.isEmpty {
                pressEnterToContinue()
            }

        } while selectedIndex == nil
        
        let choice = step.choices[selectedIndex!]

        let meaningfulLines = choice.consequenceText.filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
        if !meaningfulLines.isEmpty {
            boxedScreen(title: "Consequence", lines: choice.consequenceText)
//            waitASec(sec: 2)
            pressEnterToContinue()
        }
        

        if choice.effect() {
//            playSound(path: winSound)
            return true
        } else {
            playSound(path: gameOverSound)
            return false
        }
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
            "       ╔══════════════════════════════════════════════╗",
            "       ║              LEGENDS OF SWIFTIA              ║",
            "       ╚══════════════════════════════════════════════╝",
            "",
            "",
            "                   > PRESS ENTER TO BEGIN <",
            ""
        ]


        boxedScreen(title: "Start Screen", lines: title)
        pressEnterToContinue()
        waitASec(sec: 1)
        clearScreen()
        
//        let intro1 = [
//                "In a realm forged by magic and steel,",
//                "the land of Swiftia teeters on the brink of chaos.",
//                "Ancient evils stir, and forgotten powers awaken once more."
//            ]
//
//        boxedScreen(title: "Prologue", lines: intro1)
//        waitASec(sec: 3)
//        clearScreen()
//
//        let intro2 = intro1 + [
//            "",
//            "Only those brave enough to answer the call",
//            "can shape the fate of this troubled world."
//        ]
//
//        boxedScreen(title: "Prologue", lines: intro2)
//        waitASec(sec: 3)
//        clearScreen()
//
//        let intro3 = intro2 + [
//            "",
//            "Will you rise as a hero or fall into legend?",
//            "",
//            "The journey begins now — destiny awaits..."
//        ]
//
//        boxedScreen(title: "Prologue", lines: intro3)
//        waitASec(sec: 3)
//        pressEnterToContinue()
    }
    
    func menu() {
        let options = [
            "",
            "",
            "",
            "",
            "       ╔══════════════════════════════════════════════╗",
            "       ║              LEGENDS OF SWIFTIA              ║",
            "       ╚══════════════════════════════════════════════╝",
            "",
            "",
            "                      (1) ➤ Start Game",
            "                      (2) ➤ Quit Game",
            ""
        ]

        var selection: String?

        repeat {
            boxedScreen(title: "Main Menu", lines: options)
            print("Enter your choice [1] or [2]: ", terminator: "")
            
            if let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
                switch input {
                case "1":
                    waitASec(sec: 1.5)
                    clearScreen()
                    initGame()
                    return
                case "2":
                    print("You walk away from the tale of Swiftia. The legends will go on — without you...")
                    waitASec(sec: 2)
                    exit(0)
                default:
                    print("Invalid input. Please try again.")
                    waitASec(sec: 1)
                    clearScreen()
                }
            }
        } while selection == nil
    }

    
    func chooseHero() {
        let availableHeroes = [
            Warrior(shield: 15, bag: Bag(), name: "Warrior", hp: 100, maxHp: 100),
            Magician(mana: 25, bag: Bag(), name: "Magician", hp: 80, maxHp: 80),
            Cleric(holyPower: 25, bag: Bag(), name: "Cleric", hp: 60, maxHp: 60)
//            Warrior(shield: 15, bag: Bag(), name: "Warrior", hp: 10, maxHp: 100),
//            Magician(mana: 25, bag: Bag(), name: "Magician", hp: 10, maxHp: 80),
//            Cleric(holyPower: 25, bag: Bag(), name: "Cleric", hp: 10, maxHp: 60)
        ]

        let heroDescriptions = [
            "Tell us who you are...",
            "",
            "(1) [#] Warrior - Lots of health, moderate damage",
            "(2) <*> Magician - Low health, high damage",
            "(3) [+] Cleric - Supports the team, low damage"
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
                print("Invalid input. Please enter 1, 2 or 3.")
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
                print("Invalid input. Please enter 0, 1 or 2: ", terminator: "")
            }
        }
        
        let confirmationText: [String]
        switch numberOfCompanions {
        case 0:
            confirmationText = ["You chose to walk this path alone. A bold decision."]
        case 1:
            confirmationText = ["You chose to be accompanied by 1 companion. Strength in unity."]
        case 2:
            confirmationText = ["You chose 2 companions to aid you. A well-balanced fellowship."]
        default:
            fatalError("Unexpected number of companions: \(numberOfCompanions!)")
        }

        boxedScreen(
            title: "Confirmation",
            lines: confirmationText
        )
        pressEnterToContinue()
        waitASec(sec: 1)
    
        let baseCompanionDescription = [
            "",
            "",
            "(1) [#] Warrior - Lots of health, moderate damage",
            "(2) <*> Magician - Low health, high damage",
            "(3) [+] Cleric - Supports the team, low damage"
        ]

        let companionIntroLines = [
            "Which soul shall walk beside you into the unknown?",
            "And who shall be the second to brave the darkness?"
        ]
        
        var companionsSelected: [Hero] = []
        
        if numberOfCompanions! > 0 {
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
                                shield: 15,
                                bag: Bag(),
                                name: "Warrior Companion \(i)",
                                hp: 100,
//                                hp: 10,
                                maxHp: 100
                            )
                        case 2:
                            selectedCompanion = Magician(
                                mana: 25,
                                bag: Bag(),
                                name: "Magician Companion \(i)",
                                hp: 80,
//                                hp: 10,
                                maxHp: 80
                            )
                        case 3:
                            selectedCompanion = Cleric(
                                holyPower: 25,
                                bag: Bag(),
                                name: "Cleric Companion \(i)",
                                hp: 60,
//                                hp: 10,
                                maxHp: 60
                            )
                        default:
                            break
                        }
                    } else {
                        print("Invalid input. Please enter 1, 2 or 3: ", terminator: "")
                    }
                }
                companionsSelected.append(selectedCompanion!)
                print("Companion \(i): \(selectedCompanion!.name) selected.")
            }
        }
        
        
        var summaryLines = ["You have the following companions on your journey:", ""]
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
//        let difficultyDescriptions = [
//            "(1) {~} Emerald Grove     - A bright and welcoming forest. (Easy)",
//            "(2) {^} Twilight Thicket  - Shadows linger here.           (Medium)",
//            "(3) [O] Whispering Abyss  - Only the brave dare enter.     (Hard)"
//        ]
        let difficultyDescriptions = [
            "(1) {~} Emerald Grove                             [Easy]",
            "     - A bright and welcoming forest.",
            "       Home of Duc & Dukas, Keepers of the Confused.",
            "",
            "(2) {^} Twilight Thicket                          [Medium]",
            "     - Shadows linger between twisted trees.",
            "       Domain of Martinius, the Examiner.",
            "",
            "(3) [O] Whispering Abyss                          [Hard]",
            "     - Only the brave dare enter.",
            "       Where Justulor, Warden of Exams, awaits..."
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
                        title: "{~} Emerald Grove",
                        lines: [
                            "The trees sway gently in the wind, their leaves glowing",
                            "with morning dew.",
                            "",
                            "But be warned — Duc & Dukas, Keepers of the Confused,",
                            "cheerfully turn every question into an unexpected adventure..."
                        ]
                    )
                    pressEnterToContinue()
                    waitASec(sec: 2)
                    return .easy
                case 2:
                    boxedScreen(
                        title: "{^} Twilight Thicket",
                        lines: [
                            "A faint fog lies between the gnarled roots and crooked trunks.",
                            "",
                            "Some say Martinius, the Examiner, roams these parts still,",
                            "quizzing wanderers with riddles and relentless scrutiny..."
                        ]
                    )
                    pressEnterToContinue()
                    waitASec(sec: 2)
                    return .medium
                case 3:
                    boxedScreen(
                        title: "[O] Whispering Abyss",
                        lines: [
                            "The forest here is silent — too silent. No birds. No wind.",
                            "",
                            "Deep below, Justulor, Warden of Exams, sharpens his quill.",
                            "He waits for those bold enough to face the final challenge..."
                        ]
                    )
                    pressEnterToContinue()
                    waitASec(sec: 2)
                    return .hard
                default:
                    break
                }
            }
            print("Invalid input. Please enter 1, 2 or 3: ", terminator: "")
        }
    }

    func initSummaryScreen(player: Hero, companions: [Hero], difficulty: Difficulty) {
        var lines: [String] = []
        
        lines += ["", "You are the: `\(player.name)`", ""]
        let actualCompanions = companions.filter { $0 !== player }
        
        if actualCompanions.isEmpty {
            lines += ["", "You have no companions."]
        } else {
            lines += ["", "Your companions: ", ""]
            for companion in actualCompanions {
                lines.append("- \(companion.name)")
            }
        }
        lines.append("")
        
        lines.append("Difficulty level: \(difficulty)")
        
        boxedScreen(title: "Game Summary",
                    lines: lines)
        pressEnterToContinue()
        waitASec(sec: 2)
    }

    func resetSettings() {
        player = nil
        heroes = []
        enemies = []
        roundCounter = 0
        minionsSpawned = false
        difficulty = nil
    }
}
