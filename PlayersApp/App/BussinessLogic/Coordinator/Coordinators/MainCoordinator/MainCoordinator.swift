//
//  MainCoordinator.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import Foundation

protocol MainCoordinatorOutput: AnyObject {
    var finishFlow: CompletionBlock? { get set }
}
 
final class MainCoordinator: BaseCoordinator, MainCoordinatorOutput {
    
    var finishFlow: CompletionBlock?
    
    fileprivate let factory: MainBuilderProtocol
    fileprivate let router: Routable
    
    init(router: Routable, factory: MainBuilderProtocol) {
        self.router = router
        self.factory = factory
    }
}
 
extension MainCoordinator: Coordinator {
    func start() {
        performFlow()
    }
}

private extension MainCoordinator {
    func performFlow() {
        let view = factory.buildListScreen()
//        view.onDetailScreen = { [weak self] order in
//            self?.runDetailScreen(order: order)
//        }
        router.setRootModule(view, hideBar: true)
    }
    
//    func runDetailScreen(order: OrderInfo) {
//        let view = factory.buildDetailsScreen(order: order)
//        view.close = pop
//        router.push(view, animated: true)
//    }
    
    func pop() {
        router.popModule()
    }
    
}
