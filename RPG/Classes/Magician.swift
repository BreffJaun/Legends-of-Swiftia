//
//  Magician.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation


class Magician: Hero {
    var mana: Int
    var maxMana: Int = 25
    
    init(mana: Int, bag: Bag, name: String, hp: Int, maxHp: Int) {
        self.mana = mana
        super.init(
            bag: bag,
            name: name,
            hp: hp,
            maxHp: maxHp
        )
    }
    
    func castFireball(enemies: [Enemy]) {
        let manaCost = 10
        let fireballDamage = 15
        
        guard mana >= manaCost else {
            print("\(name) doesn't have enough mana for a fireball!")
            return
        }
        
        
        if isAttackSuccessful() {
            print("\(name) throws a fireball and deals \(fireballDamage) damage to all enemies!")
            enemies.forEach { $0.takeDamage(amount: fireballDamage) }
            mana -= manaCost
        } else {
            mana -= manaCost
            print("\(name)´s attack missed!")
        }
    }
    
    func isImmuneTo(type: StatusEffectType) -> Bool {
        return type == .curse
    }
    
    override func skipToRecharge() {
        mana += 10
        print("\(name) sits out a round to gather his magical strength!")
    }
    
    override func normalRecharge() {
        mana += 2
        if mana > maxMana {
            mana = maxMana
        }
    }
}




