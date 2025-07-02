//
//  Functions.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation

// From former Project -> StreamFlex
func clearScreen() {
    for _ in 0..<25 {
            print("")
        }
}


// From former Project -> StreamFlex
func boxedScreen(title: String, lines: [String]) {
    let width = 80
    let height = 25
    let indent = "        "

    clearScreen()

    let topBorder = "╔" + String(repeating: "═", count: width - 2) + "╗"
    let titleLine = "║" + title.centered(padding: width - 2) + "║"
    let middleBorder = "╠" + String(repeating: "═", count: width - 2) + "╣"
    let bottomBorder = "╚" + String(repeating: "═", count: width - 2) + "╝"

    print(topBorder)
    print(titleLine)
    print(middleBorder)

    let paddedLines = lines.map { indent + $0 }
    let maxContentLines = height - 4
    let displayedLines = paddedLines.prefix(maxContentLines)
    let emptyLinesCount = max(0, maxContentLines - displayedLines.count)
    var contentLines = Array(displayedLines) + Array(repeating: "", count: emptyLinesCount)
    contentLines.insert("", at: 0)
    contentLines.append("")

    for line in contentLines {
        let padded = line.padding(toLength: width - 2, withPad: " ", startingAt: 0)
        print("║" + padded + "║")
    }

    print(bottomBorder)
}


// From former Project -> StreamFlex
func pagedBox(title: String,
              lines: [String],
              pageSize: Int = 20,
              selectableRange: ClosedRange<Int>? = nil,
              onSelect: ((Int) -> Void)? = nil) {
    var page = 0
    let totalPages = (lines.count + pageSize - 1) / pageSize
    
    while true {
        clearScreen()
        let start = page * pageSize
        let end = min(start + pageSize, lines.count)
        var visibleLines = Array(lines[start..<end])
        visibleLines.insert("", at: 0)
        visibleLines.append("")

        boxedScreen(title: title, lines: visibleLines)

        print("Page \(page + 1) / \(totalPages) — (n)ext, (p)revious, (q)uit, select content (insert number): ", terminator: "")
        guard let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() else { continue }

        if input == "n" {
            if page < totalPages - 1 {
                page += 1
            } else {
                print("This is the last page.")
                Thread.sleep(forTimeInterval: 1)
            }
        } else if input == "p" {
            if page > 0 {
                page -= 1
            } else {
                print("This is the first page.")
                Thread.sleep(forTimeInterval: 1)
            }
        } else if input == "q" {
            break
        } else if let number = Int(input),
                  let range = selectableRange,
                  range.contains(number) {
            onSelect?(number)
        } else {
            print("Invalid input. Please try again.")
            Thread.sleep(forTimeInterval: 1)
        }
    }
}

func pressEnterToContinue() {
    print("Press Enter to continue...", terminator: "")
    _ = readLine()
}

func waitASec(sec: Double) {
    Thread.sleep(forTimeInterval: sec)
}

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
                    description: "Look under the rock",
                    effect: { heroes in
                        for hero in heroes {
                            hero.bag.add(item: Item(name: "Healing Potion"))
                        }
                    },
                    consequenceText: "You found healing potions under the rock! They are added to all companions' bags."
                ),
                Choice(
                    description: "Check behind the bush",
                    effect: { heroes in
                        for hero in heroes {
                            hero.hp = hero.maxHp
                        }
                    },
                    consequenceText: "A mystical fairy appears and heals all your companions completely!"
                ),
                Choice(
                    description: "Follow the screams",
                    effect: { heroes in
                        // Start battle with 3 minions (implement your battle logic)
                    },
                    consequenceText: "You encounter 3 hostile minions! Prepare for battle!"
                ),
                Choice(
                    description: "Do nothing",
                    effect: { _ in
                        // Nothing happens, but who knows?
                    },
                    consequenceText: "You wait and observe, the forest remains quiet for now."
                )
            ]
        ),
        // Step 2 bis 5 analog aufbauen, mit Story, choices und Effekten
        StoryStep(
            title: "Step 2: Deeper into the Grove",
            descriptionLines: [
                "The forest thickens and shadows dance between the trees.",
                "Your path splits into several directions."
            ],
            choices: [
                Choice(
                    description: "Search near the old tree stump",
                    effect: { heroes in
                        for hero in heroes {
                            hero.bag.add(item: Item(name: "Mana Elixir"))
                        }
                    },
                    consequenceText: "You find mana elixirs hidden near the stump and add them to your companions’ bags."
                ),
                Choice(
                    description: "Inspect the strange footprints",
                    effect: { heroes in
                        // Some effect here (e.g., gain insight or trap)
                    },
                    consequenceText: "The footprints lead you to a hidden trap, but you manage to avoid it."
                ),
                Choice(
                    description: "Call out to the forest spirits",
                    effect: { heroes in
                        for hero in heroes {
                            hero.hp += 10
                            if hero.hp > hero.maxHp { hero.hp = hero.maxHp }
                        }
                    },
                    consequenceText: "The spirits bless you and restore some health to all companions."
                ),
                Choice(
                    description: "Rest for a moment",
                    effect: { _ in
                        // Maybe nothing or small health regen
                    },
                    consequenceText: "You take a moment to catch your breath, nothing happens."
                )
            ]
        ),

        // Step 3, 4, 5 ähnlich...
    ]
}

func playStoryStep(_ step: StoryStep, heroes: inout [Hero]) {
    boxedScreen(title: step.title, lines: step.descriptionLines)
    
    for (index, choice) in step.choices.enumerated() {
        print("(\(index + 1)) \(choice.description)")
    }
    print("Choose an option (1-\(step.choices.count)): ", terminator: "")
    
    var selectedChoice: Choice? = nil
    while selectedChoice == nil {
        if let input = readLine(), let choiceNum = Int(input), (1...step.choices.count).contains(choiceNum) {
            selectedChoice = step.choices[choiceNum - 1]
        } else {
            print("❌ Invalid input. Please enter a number between 1 and \(step.choices.count): ", terminator: "")
        }
    }
    
    selectedChoice!.effect(&heroes)
    
    boxedScreen(
        title: "Outcome",
        lines: [selectedChoice!.consequenceText]
    )
    
    boxedScreen(
        title: "Moving On",
        lines: ["You press onward deeper into the forest..."]
    )
}


func playEasyStory(heroes: inout [Hero]) {
    let steps = easyStorySteps()
    for step in steps {
        playStoryStep(step, heroes: &heroes)
    }
}

