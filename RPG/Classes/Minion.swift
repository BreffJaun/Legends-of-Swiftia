//
//  Minion.swift
//  RPG
//
//  Created by Jeff Braun on 01.07.25.
//

import Foundation


class Minion: Enemy {
    override init(name: String, hp: Int, maxHp: Int) {
        super.init(
            name: name,
            hp: hp,
            maxHp: maxHp
        )
    }
    
    func minionSpecialAttack(target: Character) {
        guard target.isAlive() else { return }
        let specialDamage = 12
        print("\(name) performs a special attack on \(target.name) and causes \(specialDamage) damage!")
        target.takeDamage(amount: specialDamage)
    }
}



