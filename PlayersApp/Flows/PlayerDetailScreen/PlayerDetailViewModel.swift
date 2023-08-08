//
//  PlayerDetailViewModel.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import Foundation

protocol PlayerDetailViewModel {
    var player: Player { get }
    func removePlayer()
}

protocol PlayerDetailDelegate: AnyObject {
    func removePlayer(_ player: Player)
}

final class PlayerDetailViewModelImpl: PlayerDetailViewModel {
    
    let player: Player
    
    init(player: Player) {
        self.player = player
    }
    
    weak var delegate: PlayerDetailDelegate?
    
    func removePlayer() {
        delegate?.removePlayer(player)
    }
}
