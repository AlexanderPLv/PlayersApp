//
//  CoordinatorFactory.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func makeMainCoordinator(with router: Routable) -> Coordinator & MainCoordinatorOutput
}

final class CoordinatorFactory {
    private lazy var modulesFactory = ModulesFactory.build()
}
 
extension CoordinatorFactory: CoordinatorFactoryProtocol {
    
    func makeMainCoordinator(with router: Routable) -> Coordinator & MainCoordinatorOutput {
        return MainCoordinator(router: router, factory: modulesFactory)
    }
}
