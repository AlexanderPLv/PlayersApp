//
//  Player.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import Foundation

struct Player: Codable {
    let personalInfo: PersonalInfo
    let playerStats: PlayerStats
    
    enum CodingKeys: String, CodingKey {
        case personalInfo = "player"
        case playerStats = "player_info"
    }
}

extension Player: Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        if lhs.personalInfo.country == rhs.personalInfo.country {
            return lhs.playerStats.score > rhs.playerStats.score
        }
        return lhs.personalInfo.country < rhs.personalInfo.country
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.personalInfo.country == rhs.personalInfo.country &&
        lhs.playerStats.score == rhs.playerStats.score
    }
}
