//
//  MockNetworkService.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import Foundation

final class MockNetworkService: DataProvider {
    
    func fetchPlayers() throws -> [Player] {
        guard let path = Bundle.main.path(forResource: "players", ofType: "json") else { return [] }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let players = try decoder.decode([Player].self, from: data)
            return players
        } catch let error {
            throw error
        }
    }
}
