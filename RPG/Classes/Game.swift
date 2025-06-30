//
//  Game.swift
//  RPG
//
//  Created by Jeff Braun on 30.06.25.
//

import Foundation


class Game {
    var heroes: [Hero] = []
    var enemies: [Enemy] = []
    var roundCounter: Int
    var minionsSpawned: Bool = false
    
    init(heroes: [Hero], enemies: [Enemy], roundCounter: Int, minionsSpawned: Bool) {
        self.heroes = heroes
        self.enemies = enemies
        self.roundCounter = roundCounter
        self.minionsSpawned = minionsSpawned
    }
    
    func start() {
        
    }
    
    func round() {
        
    }
     
    func printStatus() {
        
    }
    
    func checkGameOver() -> Bool {
        return true
    }
    
    func addMinionIfNeeded() {
        
    }
    
    
}
