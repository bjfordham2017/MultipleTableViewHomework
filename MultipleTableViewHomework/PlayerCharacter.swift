//
//  PlayerCharacter.swift
//  MultipleTableViewHomework
//
//  Created by Brent Fordham on 6/19/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation

class PlayerCharacter {
    enum StatType {
        case str
        case dex
        case int
        case hea
    }
    
    var name: String
    
    var strength: Int = 10
    var dexterity: Int = 10
    var intelligence: Int = 10
    var health: Int = 10
    
    var hitPoints: Int = 10
    var fatiguePoints: Int = 10
    
    var xp: Int = 0
    
    init(_ name: String) {
        self.name = name
    }
    
    func increaseXP(_ increase: Int) {
        self.xp += increase
    }
    
    func spendXP(on stat: StatType) {
        switch stat {
        case .str:
            if xp > 9 {
                strength += 1
                hitPoints += 1
                xp -= 10
            }
        case .dex:
            if xp > 9 {
                dexterity += 1
                xp -= 10
            }
        case .int:
            if xp > 9 {
                intelligence += 1
                xp -= 10
            }
        case .hea:
            if xp > 9 {
                health += 1
                fatiguePoints += 1
                xp -= 10
            }
        }
    }
    
    func wound() {
        if hitPoints > 0 {
            hitPoints -= 1
        }
    }
    
    func heal() {
        if hitPoints < strength {
            hitPoints += 1
        }
    }
    
    func drain() {
        if fatiguePoints > 0 {
            fatiguePoints -= 1
        }
    }
    
    func restore() {
        if fatiguePoints < health {
            fatiguePoints += 1
        }
    }
    
}
