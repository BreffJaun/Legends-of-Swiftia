//
//  Enemy.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation


class Enemy: Character {
    init(name: String, hp: Int, maxHp: Int) {
        super.init(
            name: name,
            hp: hp,
            maxHp: maxHp,
            damage: 8
        )
    }
}


class Boss: Enemy {
    private var hasSummonedMinion = false
    private var hasUsedUltimate = false
    var curseDuration: Int = 3
    var minion: Minion?
    
    init(curseDuration: Int, name: String, hp: Int, maxHp: Int) {
        self.curseDuration = curseDuration
        super.init(
            name: name,
            hp: hp,
            maxHp: maxHp
        )
    }
    
    override func attack(target: Character) {
        guard target.isAlive() else { return }
        print("\(name) performs a powerful single attack against \(target.name)!") // maybe a print too much?
        super.attack(target: target)
    }
    
    func areaAttack(heroes: [Hero]) {
        let areaDamage = 20
        print("\(name) unleashes an area attack and hits all heroes with \(areaDamage) damage!")
        heroes.filter { $0.isAlive() }
              .forEach {
                  print("\($0.name) gets \(areaDamage) damage.")
                  $0.takeDamage(amount: areaDamage)
              }
    }
    
    func summonMinion() -> Minion? {
        guard !hasSummonedMinion else {
            print("\(name) has already summoned a minion!")
            return nil
        }
        
        print("\(name) summoned a minion!")
        let newMinion = Minion(name: "Minion from \(name)", hp: 30, maxHp: 30)
        minion = newMinion
        hasSummonedMinion = true
        return newMinion
    }
    
    func bossSpecialAttack(heroes: [Hero]) {
        guard !hasUsedUltimate else {
            print("\(name) can only use special attack once!")
            return
        }
        print("\(name) unleashes its ultimate attack!")
        let ultDamage = 25
        heroes.filter { $0.isAlive() }
               .forEach { $0.takeDamage(amount: ultDamage) }
        hasUsedUltimate = true
    }
    
    func curse(target: Character) {
        let curseDuration = 3
        print("\(name) curses \(target.name) for \(curseDuration) rounds!")
        let curseEffect = StatusEffect(type: .curse, duration: curseDuration)
        target.applyStatus(status: curseEffect)
    }
    

}

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



