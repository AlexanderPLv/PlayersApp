//
//  PlayersListViewModel.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import Foundation
import Algorithms

protocol PlayersListViewModel {
    var items: [[Player]] { get }
    func fetchPlayers() throws
    func removePlayer(_ player: Player)
}

final class PlayersListViewModelImpl: PlayersListViewModel {
    
    private let dataProvider: DataProvider
    
    var items = [[Player]]()
    
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
    
    func fetchPlayers() throws {
        var result = [[Player]]()
        let players = try dataProvider.fetchPlayers()
        let playersByCountry = players
            .sorted()
            .chunked(on: \.personalInfo.country)
        playersByCountry.forEach { _, players in
            result.append(Array(players))
        }
        items = result
    }
    
    func removePlayer(_ player: Player) {
        guard let index = items.firstIndex(where: { $0.first?.personalInfo.country == player.personalInfo.country }) else {
            return
        }
        items[index].removeAll { item in
            item.personalInfo.name == player.personalInfo.name
        }
        guard items[index].isEmpty else { return }
        items.remove(at: index)
    }
}
