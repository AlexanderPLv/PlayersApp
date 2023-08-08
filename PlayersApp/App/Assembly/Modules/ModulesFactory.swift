//
//  ModulesFactory.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import Foundation

protocol MainBuilderProtocol {
    func buildListScreen() -> PlayersListScreen
    func buildDetailsScreen() -> PlayerDetailScreen
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
    
    func buildDetailsScreen() -> PlayerDetailScreen {
        let screen = PlayerDetailScreen()
        return screen
    }
}
