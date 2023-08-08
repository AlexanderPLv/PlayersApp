//
//  Player.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import Foundation

struct Player: Codable {
    let name: String
    let country: String
    let age: Int
    let playerInfo: PlayerInfo
}
