//
//  PlayersListScreen.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import UIKit

final class PlayersListScreen: UIViewController {
    
    var viewModel: PlayersListViewModel
    
    private let collectionView: UICollectionView
    
    init(
        viewModel: PlayersListViewModel
    ) {
        self.viewModel = viewModel
        let layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .red
    }
}

private extension PlayersListScreen {
    
    func setupViews() {
        
    }
}
