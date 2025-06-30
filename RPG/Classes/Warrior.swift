//
//  Warriot.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation


class Warrior: Hero {
    var shield: Int
    
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
        let strikeDamage = 20
       print("\(name) performs a power strike against \(target.name) and causes \(strikeDamage) damage!")
       target.takeDamage(amount: strikeDamage)
    }
    
}


