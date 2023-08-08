//
//  ModulesFactory.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import Foundation

protocol MainBuilderProtocol {
    func buildListScreen() -> PlayersListScreen
    func buildDetailsScreen(player: Player, _ delegate: PlayerDetailDelegate) -> PlayerDetailScreen
}

final class ModulesFactory {
    
    private init() {
    }
    
    class func build() -> ModulesFactory {
        let factory = ModulesFactory()
        return factory
    }
}

extension ModulesFactory: MainBuilderProtocol {
    
    func buildListScreen() -> PlayersListScreen {
        let viewModel = PlayersListViewModelImpl(dataProvider: MockNetworkService())
        let screen = PlayersListScreen(viewModel: viewModel)
        return screen
    }
    
    func buildDetailsScreen(player: Player, _ delegate: PlayerDetailDelegate) -> PlayerDetailScreen {
        let viewModel = PlayerDetailViewModelImpl(player: player)
        viewModel.delegate = delegate
        let screen = PlayerDetailScreen(viewModel: viewModel)
        return screen
    }
}
