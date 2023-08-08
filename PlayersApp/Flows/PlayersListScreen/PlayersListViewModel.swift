//
//  PlayersListViewModel.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import Foundation

protocol PlayersListViewModel {
    var onDetailScreen: ((Player) -> Void)? { get set }
    func fetchPlayers() throws -> [Player]
}

final class PlayersListViewModelImpl: PlayersListViewModel {
    
    var onDetailScreen: ((Player) -> Void)?
    
    private let dataProvider: DataProvider
    
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
    
    func fetchPlayers() throws -> [Player] {
        let players = try dataProvider.fetchPlayers()
        return players
    }
    
}
