//
//  Warriot.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation


class Warrior: Hero {
    var shield: Int
    var endurance: Int = 25
    var maxEndurance: Int = 25
    
    init(shield: Int, bag: Bag, name: String, hp: Int, maxHp: Int) {
        self.shield = shield
        super.init(
            bag: bag,
            name: name,
            hp: hp,
            maxHp: maxHp
        )
    }
    
    func powerStrike(target: Character) {
        let enduranceCost = 10
        let strikeDamage = 20
        
        guard endurance >= enduranceCost else {
            print("\(name) doesn't have enough endurance for a power strike!")
            return
        }
        
        if isAttackSuccessful() {
            print("\(name) performs a power strike against \(target.name)!")
            target.takeDamage(amount: strikeDamage)
            endurance -= 10
        } else {
            endurance -= 10
            print("\(name)´s attack missed!")
        }
    }
    
    func isImmuneTo(type: StatusEffectType) -> Bool {
        return type == .freeze || type == .paralyze
    }
        
    override func skipToRecharge() {
        endurance += 10
        print("\(name) sits out a round to gather his physical strength!")
    }
    
    override func normalRecharge() {
        endurance += 2
        if endurance > maxEndurance {
            endurance = maxEndurance
        }
    }
}


