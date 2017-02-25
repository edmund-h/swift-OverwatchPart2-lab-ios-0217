//
//  HeroAttributes.swift
//  Overwatch
//
//  Created by Edmund Holderbaum on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum HeroName: String {
    case genji = "Genji", mcCree = "McCree", pharah = "Pharah", reaper = "Reaper", soldier76 = "Soldier76", tracer = "Tracer", bastion = "Bastion", hanzo = "Hanzo", junkrat = "Junkrat", mei = "Mei", torbjörn = "Torbjörn", widowmaker = "Widowmaker", dva = "DVA", reinhardt = "Reinhardt", roadhog = "Roadhog", winston = "Winston", zarya = "Zarya", ana = "Ana", lúcio = "Lúcio", mercy = "Mercy", symmetra = "Symmetra", zenyatta = "Zenyatta"
    
    static func heroes(with type: HeroType)->[HeroName]{
        switch type{
        case .offense: return [.genji, .mcCree, .pharah, .reaper, .soldier76, .tracer]
        case .defense: return [.bastion, .hanzo, .junkrat, .mei, .torbjörn, .widowmaker]
        case .tank: return [.dva, .reinhardt, .roadhog, .winston, .zarya]
        case .support: return [.ana, .lúcio, .mercy, .symmetra, .zenyatta]
        }
    }
    var description: String{
        return self.rawValue
    }
    
}

enum HeroType: CustomStringConvertible {
    case offense, support, defense, tank
    var description: String{
        switch self{
        case .offense:
            return "Offense: 💥"
        case .defense:
            return "Defense: 🛡"
        case .support:
            return "Support: 🚑"
        case .tank:
            return "Tank: 🐼"
        }
    }
    
    static var allTypes: [HeroType] = [.offense, .defense, .tank, .support]
}



