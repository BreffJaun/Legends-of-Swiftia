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
            damage: 15
        )
    }
    
    func normalRecharge() {}
}








