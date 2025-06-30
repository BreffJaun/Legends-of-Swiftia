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
            c.takeDamage(amount: 5)
            print("\(c.name) suffers 5 poison damage!")
        case .burn:
            c.takeDamage(amount: 3)
            print("\(c.name) is burning and takes 3 damage!")
        case .curse:
            c.takeDamage(amount: 4)
            print("\(c.name) is cursed and takes 4 damage!")
        case .freeze, .paralyze:
            // Zum Beispiel: Lähmung oder Einfrieren könnte Bewegung blockieren, aber keinen Schaden machen
            print("\(c.name) is affected by \(type.rawValue)!")
        }
    }
    
    func tick() {
        duration -= 1
    }
    
}



