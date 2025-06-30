//
//  Item.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation

struct Item: Usable, CustomStringConvertible {
    var name: String
    var damage: Int
    var defense: Int
    var usesLeft: Int
    var description: String {
        var effects: [String] = []
        if damage > 0 {
            effects.append("Deals \(damage) damage")
        }
        if defense > 0 {
            effects.append("Restores \(defense) HP")
        }
        return "\(name): \(effects.joined(separator: ", ")) | Uses left: \(usesLeft)"
    }
    
    mutating func use(target: Character) {
        guard !isDepleted() else {
            print("\(name) has no uses left!")
            return
        }
        
        if damage > 0 {
            target.takeDamage(amount: damage)
        }
        
        if defense > 0 {
            target.heal(amount: defense)
        }
        usesLeft -= 1
        
        if damage == 0 && defense == 0 {
            print("\(name) DOES NOTHING ! ! ! HAVE A LOOK INTO THE INSTANCE")
        }
    }
    
    func isDepleted() -> Bool {
        return usesLeft <= 0
    }
}



