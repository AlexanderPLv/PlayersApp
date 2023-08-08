//
//  DataProvider.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import Foundation

protocol DataProvider {
    func fetchPlayers() throws -> [Player]
}
