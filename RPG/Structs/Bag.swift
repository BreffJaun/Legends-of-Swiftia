//
//  Bag.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation

struct Bag {
    var items: [Item]
    
    mutating func menu(currentHero: Character) {
        guard !items.isEmpty else {
            print("Your bag is empty!")
            return
        }
        
        print("Items in your bag:")
        items.enumerated().forEach { (index, item) in
            print("[\(index)] \(item.description)")
        }
        
        print("Choose an item number to use (or press Enter to cancel): ", terminator: "")
        if let input = readLine(), let choice = Int(input), choice >= 0 && choice < items.count {
            var item = items[choice]
            item.use(target: currentHero)
            
            if item.isDepleted() {
                print("\(item.name) is depleted and will be removed.")
            }
            
            items[choice].usesLeft -= 1
            
            removeDepletedItems()
        } else {
            print("No item used.")
        }
    }
    
    mutating func removeDepletedItems() {
        items.removeAll { $0.isDepleted() }
    }
}
