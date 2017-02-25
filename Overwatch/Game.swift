//
//  Game.swift
//  Overwatch
//
//  Created by Edmund Holderbaum on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//
//to make scrollview larger than device dimensions equalwidths constraint - multiplier dropdown

import Foundation

struct Game {
    var offenseCharacters : [Hero] = []
    var defenseCharacters : [Hero] = []
    var supportCharacers : [Hero] = []
    var tankCharacters : [Hero] = []
    var heroType : HeroType = .offense
    
    init () {
        createAllHeroes()
    }
}

// start of ugliness

extension Game {
    mutating func createAllHeroes() {
        for type in HeroType.allTypes {
            for name in HeroName.heroes(with: type) {
                let name = Hero(name: name)
                switch type {
                case .offense:
                    offenseCharacters.append(name)
                case .defense:
                    defenseCharacters.append(name)
                case .support:
                    supportCharacers.append(name)
                case .tank:
                    supportCharacers.append(name)
                    
                }
            }
        }
    }
}

// end of ugliness

