//
//  Hero.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation

class Hero: Character {
    var bag: Bag
       
    init(bag: Bag, name: String, hp: Int, maxHp: Int) {
        self.bag = bag
        super.init(
            name: name,
            hp: hp,
            maxHp: maxHp,
            damage: 12
        )
    }
    
    func chooseAction(enemies: [Enemy]) {
        let options = [
//                 "",
                 "(1) ➤ attack",
                 "(2) ➤ heal",
                 "(3) ➤ use item",
//                 ""
        ]
            
        var running = true
        while running {
            boxedScreen(title: "What would you like to do?", lines: options)
            print("Your choice: ", terminator: "")
            
            guard let input = readLine(), let choice = Int(input) else {
                print("Invalid input.")
                continue
            }
            
            switch choice {
            case 1:
                if enemies.isEmpty {
                    print("There are no enemies to attack.")
                    break
                }
                let enemyOptions = enemies.enumerated().map { (i, el) in
                    "(\(i + 1)) ➤ \(el.name) (\(el.hp) HP)" }
                var selectedIndex: Int? = nil

                pagedBox(title: "Choose a target", lines: enemyOptions, selectableRange: 1...enemies.count) { index in
                    selectedIndex = index - 1
                }

                if let index = selectedIndex {
                    let target = enemies[index]
                    attack(target: target)
                    running = false
                }
            case 2:
                heal(target: self)
                running = false
            case 3:
                useItem()
                running = false
            default:
                print("Please enter a number between 1 and 3: ", terminator: "")
            }
        }
    }
    
    
    func heal(target: Character) {
        let healAmount = 15
        let currentHeal = min(healAmount, target.maxHp - target.hp)
        target.hp += currentHeal
        
        boxedScreen(
            title: "Healing",
            lines: [
                "\(target.name) was healed by \(currentHeal).",
                "New HP value: \(target.hp)/\(target.maxHp)"
            ])
        Thread.sleep(forTimeInterval: 2)
    }
    
    func useItem() {
        let items = bag.items
        guard !items.isEmpty else {
            boxedScreen(
                title: "Inventory",
                lines: ["Your inventory is empty."])
            Thread.sleep(forTimeInterval: 2)
            return
        }
        
        var lines = [""]
        lines += items.enumerated().map { (i, el) in
            "(\(i + 1)) ➤ \(el.name)" }
        var selectedIndex: Int? = nil
        lines.append("")
        
        
        pagedBox(
            title: "Choose an item",
            lines: lines,
            selectableRange: 1...items.count,
            onSelect: { index in
                selectedIndex = index - 1
            }
        )
        
        guard let index = selectedIndex else { return }
        var item = items[index]
        
        boxedScreen(
            title: "Item used",
            lines: [
//            "",
            "You have used \(item.name).",
//            ""
        ])
        item.use(target: self)
        bag.items.remove(at: index)
        Thread.sleep(forTimeInterval: 2)
    }
}


