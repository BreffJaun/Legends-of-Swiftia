//
//  Bag.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation

struct Bag: CustomStringConvertible {
    var description: String {
        if items.isEmpty {
            return "Bag is empty."
        } else {
            return items.enumerated().map { (index, item) in
                "(\(index + 1)) \(item.name) (\(item.usesLeft)x)"
            }.joined(separator: "\n")
        }
    }
    
    var items: [Item] = []
    
    mutating func menu(currentHero: Character) {
        guard !items.isEmpty else {
            boxedScreen(title: "{ } - Inventory", lines: ["Your bag is empty."])
            pressEnterToContinue()
            playSound(path: closeBagSound)
            return
        }

        let itemLines = items.enumerated().map { (index, item) in
            "(\(index + 1)) ➤ \(item.name) (\(item.usesLeft)x)"
        }

        var selectedIndex: Int?

        pagedBox(
            title: "{¤} - Inventory",
            lines: itemLines,
            selectableRange: 1...items.count,
            onSelect: { number in
                    selectedIndex = number - 1
                }
        )

        // Just happens if no item will be selected
        guard let index = selectedIndex else {
            print("No item used.")
            waitASec(sec: 1.5)
            return
        }

        var item = items[index]
        item.use(target: currentHero)

        items[index].usesLeft -= 1
        if items[index].isDepleted() {
            print("\(item.name) has been used up and will be removed.")
            playSound(path: useItemSound)
            pressEnterToContinue()
            playSound(path: closeBagSound)
        }
        removeDepletedItems()
    }

    
    mutating func removeDepletedItems() {
        items.removeAll { $0.isDepleted() }
    }
}







