//
//  Character.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation


class Character: CustomStringConvertible {
    var name: String
    var hp: Int
    var maxHp: Int
    var damage: Int
    private(set) var statusEffects: [StatusEffect] = []
    var description: String {
        return "\(name): \(hp)/\(maxHp) HP | Status Effects: \(statusEffects.map { $0.description }.joined(separator: ", "))"
    }
    
    init(name: String, hp: Int, maxHp: Int, damage: Int = 10) {
        self.name = name
        self.hp = hp
        self.maxHp = maxHp
        self.damage = damage
    }
    
    func isAlive() -> Bool {
        return hp > 0
    }
    
    func takeDamage(amount: Int) {
        hp -= amount
        if hp < 0 {
            hp = 0
        }
        print("\(name) takes \(amount) damage. Remaining HP: \(hp)/\(maxHp)")
    }
    
    func heal(amount: Int) {
        if !isAlive() {
            print("\(name) cannot be healed because they are defeated.")
            return
        }
        
        hp += amount
        if hp > maxHp {
            hp = maxHp
        }
        print("\(name) heals for \(amount). Current HP: \(hp)/\(maxHp)")
    }
    
    func attack(target: Character) {
        guard isAlive() else {
            print("\(name) is defeated and cannot attack.")
            return
        }
        
        let variation = Int.random(in: -2...2)
        let totalDamage = max(0, damage + variation)
        
        print("\(name) attacks \(target.name) for \(totalDamage) damage.")
        target.takeDamage(amount: totalDamage)
    }
    
    func applyStatus(status: StatusEffect) {
     if let index = statusEffects.firstIndex(where: { $0.type == status.type }) {
         statusEffects[index].duration = status.duration
         print("\(name) renews the effect \(status.type.rawValue.capitalized) for \(status.duration) rounds.")
    } else {
        statusEffects.append(status)
        print("\(name) is now affected by \(status.type.rawValue.capitalized) for \(status.duration) rounds.")
        }
    }
    
    func processStatusEffects() {
        for status in statusEffects {
            status.applyTo(c: self)
            status.tick()
        }
        statusEffects.removeAll { $0.duration <= 0 }
    }
}


