//
//  Cleric.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation


class Cleric: Hero {
    var holyPower: Int
    
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
        print("\(name) heals all allies by \(healAmount) HP!")
        heroes.filter { $0.isAlive() }
              .forEach { $0.heal(amount: healAmount) }
    }
    
    func isImmuneTo(type: StatusEffectType) -> Bool {
        return type == .poison
    }
}



