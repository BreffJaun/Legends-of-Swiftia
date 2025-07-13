//
//  Boss.swift
//  RPG
//
//  Created by Jeff Braun on 01.07.25.
//

import Foundation

class Boss: Enemy {
    var endurance: Int = 30
    var maxEndurance: Int = 30
    var mana: Int = 30
    var maxMana: Int = 30
    private var hasSummonedMinions = false
    private var hasUsedUltimate = false
    var curseDuration: Int = 3
//    var minion: [Minion]?
    
    init(curseDuration: Int, name: String, hp: Int, maxHp: Int) {
        self.curseDuration = curseDuration
        super.init(
            name: name,
            hp: hp,
            maxHp: maxHp
        )
    }
    
    override func attack(target: Character) {
//        guard target.isAlive() else { return }
        print("\(name) performs a powerful single attack against \(target.name)!") // maybe a print too much?
        super.attack(target: target)
    }
    
    func areaAttack(heroes: [Hero]) {
        let areaDamage = 20
        let enduranceCost = 10
        
//        guard endurance >= enduranceCost else {
//            print("\(name) doesn't have enough endurance for an area attack!")
//            return
//        }
        print("\(name) unleashes an area attack and hits all heroes with massive damage!")
        heroes.forEach {
//                  print("\($0.name) gets \(areaDamage) damage.")
                  $0.takeDamage(amount: areaDamage)
              }
        endurance -= enduranceCost
    }
    
    func summonMinions() -> [Minion]? {
        guard !hasSummonedMinions else {
//            print("\(name) has already summoned a minion!")
            return nil
        }
        
        guard hp <= maxHp / 2 else {
//            print("\(name) is not weak enough to summon a minion yet!")
            return nil
        }
        
        print("\(name) summoned minions!")
        let protMinion1 = Minion(name: "Warden 1 of \(name)", hp: 30)
        let protMinion2 = Minion(name: "Warden 2 of \(name)", hp: 30)
        let protectorMinions = [protMinion1, protMinion2]
        hasSummonedMinions = true
        return protectorMinions
    }
    
    func bossSpecialAttack(heroes: [Hero]) {
        guard !hasUsedUltimate else {
            print("\(name) can only use special attack once!")
            return
        }
        print("\(name) unleashes its ultimate attack!")
        let ultDamage = 25
        heroes.forEach { $0.takeDamage(amount: ultDamage) }
        hasUsedUltimate = true
    }
    
    func curse(target: Character) {
        let manaCost = 10
        let curseDuration = 3
        print("\(name) curses \(target.name) for \(curseDuration) rounds!")
        let curseEffect = StatusEffect(type: .curse, duration: curseDuration)
        target.applyStatus(status: curseEffect)
        mana -= manaCost
    }
    
    override func randomAttack(target: Character, heroes: [Hero]?) -> [Minion]? {
        if !hasSummonedMinions && hp <= maxHp / 2 {
            let summoned = summonMinions()
            return summoned
        }
    
        var availableActions: [() -> Void] = []

        availableActions.append {
            self.attack(target: target)
            self.normalRecharge()
        }

        if endurance >= 10 {
            availableActions.append {
                self.areaAttack(heroes: heroes!)
            }
        }

        if !hasUsedUltimate {
            availableActions.append {
                self.bossSpecialAttack(heroes: heroes!)
            }
        }

        if mana >= 10 {
            availableActions.append {
                self.curse(target: target)
            }
        }

        if availableActions.isEmpty {
            print("\(name) is resting to regain endurance...")
            targetedRecharge()
            return nil
        }
        
        if isAttackSuccessful() {
            let chosenAction = availableActions.randomElement()!
            chosenAction()
        } else {
            print("\(name)´s attack missed!")
        }
        return nil
    }

    
    override func normalRecharge() {
        endurance += 5
        mana += 5
        if endurance > maxEndurance {
            endurance = maxEndurance
        }
        if mana > maxMana {
            mana = maxMana
        }
    }
    
    func targetedRecharge() {
        endurance += 10
        mana += 10
    }

}
