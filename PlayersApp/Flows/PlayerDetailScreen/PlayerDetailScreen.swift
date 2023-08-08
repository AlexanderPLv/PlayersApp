//
//  PlayerDetailScreen.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import UIKit

final class PlayerDetailScreen: UIViewController {
    
    var close: CompletionBlock?
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension PlayerDetailScreen {
    
    func setupViews() {
        
    }
}
