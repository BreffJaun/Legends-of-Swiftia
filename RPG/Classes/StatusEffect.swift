//
//  StatusEffecz.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation

class StatusEffect: CustomStringConvertible {
    var description: String {
        return "\(type.rawValue.capitalized) (\(duration) rounds left)"
    }

    
    let type: StatusEffectType
    var duration: Int
    
    init(type: StatusEffectType, duration: Int) {
        self.type = type
        self.duration = duration
    }
    
    func applyTo(c: Character) {
        switch type {
        case .poison:
            print("\(c.name) suffers poison damage!")
            c.takeDamage(amount: 5)
        case .burn:
            print("\(c.name) is burning and takes damage!")
            c.takeDamage(amount: 3)
        case .curse:
            print("\(c.name) is cursed and takes damage!")
            c.takeDamage(amount: 4)
        case .freeze:
            print("\(c.name) is frozen and must skip a turn!")
        case .paralyze:
            print("\(c.name) is paralyzed and must skip a turn!")
        }
    }
    
    func tick() {
        duration -= 1
    }
    
}



