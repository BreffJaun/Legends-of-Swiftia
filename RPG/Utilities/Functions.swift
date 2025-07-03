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
//        visibleLines.insert("", at: 0)
//        visibleLines.append("")

        boxedScreen(title: title, lines: visibleLines)

        print("Page \(page + 1) / \(totalPages) — (n)ext, (p)revious, (q)uit, select an item (insert number): ", terminator: "")
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
            break
        } else {
            print("Invalid input. Please try again.")
            Thread.sleep(forTimeInterval: 1)
        }
    }
}

func pressEnterToContinue() {
    print("Press Enter to continue... ", terminator: "")
    _ = readLine()
}

func waitASec(sec: Double) {
    Thread.sleep(forTimeInterval: sec)
}


