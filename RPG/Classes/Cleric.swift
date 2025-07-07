//
//  Cleric.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation


class Cleric: Hero {
    var holyPower: Int
    var maxHolyPower: Int = 25
    
    init(holyPower: Int, bag: Bag, name: String, hp: Int, maxHp: Int) {
        self.holyPower = holyPower
        super.init(
            bag: bag,
            name: name,
            hp: hp,
            maxHp: maxHp
        )
    }
    
    func massHeal(heroes: [Hero]) {
        let healAmount = 10
        
        if isAttackSuccessful() {
            print("\(name) heals all allies by \(healAmount) HP!")
            heroes.forEach { $0.heal(amount: healAmount) }
        } else {
            holyPower -= 10
            print("\(name)´s attack missed!")
        }
    }
    
    func isImmuneTo(type: StatusEffectType) -> Bool {
        return type == .poison
    }
    
    override func skipToRecharge() {
        holyPower += 10
        print("\(name) sits out a round to gather his spritual strength!")
    }
    
    override func normalRecharge() {
        holyPower += 2
        if holyPower > maxHolyPower {
            holyPower = maxHolyPower
        }
    }
}



