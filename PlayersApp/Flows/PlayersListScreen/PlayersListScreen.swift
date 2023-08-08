//
//  PlayersListScreen.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import UIKit

final class PlayersListScreen: UIViewController {
    
    var onDetailScreen: ((Player) -> Void)?
    
    var viewModel: PlayersListViewModel
    private let collectionView: UICollectionView
    
    init(
        viewModel: PlayersListViewModel
    ) {
        self.viewModel = viewModel
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = true
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchPlayers()
    }
}

private extension PlayersListScreen {
    
    func fetchPlayers() {
        do {
            try viewModel.fetchPlayers()
            collectionView.reloadData()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func setupViews() {
        title = "Players"
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PlayerListCell.self, forCellWithReuseIdentifier: PlayerListCell.reuseIdentifier)
        collectionView.register(PlayerListHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PlayerListHeader.reuseIdentifier)
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
}

extension PlayersListScreen: PlayerDetailDelegate {
    func removePlayer(_ player: Player) {
        viewModel.removePlayer(player)
        collectionView.reloadData()
    }
}

extension PlayersListScreen: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onDetailScreen?(viewModel.items[indexPath.section][indexPath.item])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: PlayerListHeader.reuseIdentifier,
                    for: indexPath
                ) as? PlayerListHeader else { fatalError("dequeueReusableSupplementaryHeaderError.") }
                header.setTitle(viewModel.items[indexPath.section].first?.personalInfo.country)
                return header
            default:
                fatalError("Unexpected element kind")
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PlayerListCell.reuseIdentifier,
            for: indexPath) as? PlayerListCell else {
            fatalError("PlayerListCell dequeue error.")
        }
        cell.item = viewModel.items[indexPath.section][indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.bounds.width - 40.0, height: 50.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.bounds.width, height: 70.0)
    }
}
