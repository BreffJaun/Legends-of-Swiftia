//
//  Minion.swift
//  RPG
//
//  Created by Jeff Braun on 01.07.25.
//

import Foundation


class Minion: Enemy {
    var endurance: Int = 25
    var maxEndurance: Int = 25
    
    init(name: String, hp: Int) {
        super.init(
            name: name,
            hp: hp,
            maxHp: 30
        )
    }
    
    func minionSpecialAttack(target: Character) {
        let specialDamage = 15
        let enduranceCost = 10
        
        guard endurance >= enduranceCost else {
            print("\(name) doesn't have enough endurance for an attack with a ghostly blade!")
            return
        }
        print("\(name) strikes with a ghostly blade on \(target.name)!")
        target.takeDamage(amount: specialDamage)
        endurance -= 10
    }
    
    func randomAttack(target: Character) {
        if isAttackSuccessful() {
            if endurance >= 10 {
                
                let useSpecial = Bool.random()
                if useSpecial {
                    minionSpecialAttack(target: target)
                } else {
                    attack(target: target)
                    normalRecharge()
                }
            } else {
                attack(target: target)
                normalRecharge()
            }
        } else {
            print("\(name)´s attack missed!")
        }
    }
    
    override func normalRecharge() {
        endurance += 2
        if endurance > maxEndurance {
            endurance = maxEndurance
        }
    }
}













