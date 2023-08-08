//
//  PlayerListCell.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

final class PlayerListCell: UICollectionViewCell {
    
    private let arrow: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "chevron.right"))
        view.tintColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let labelView = LabelView()
    
    var item: Player? {
        didSet {
            guard let item else { return }
            labelView.set(title: item.personalInfo.name, text: item.playerStats.score.formatted())
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PlayerListCell {
    func setupViews() {
        
        addSubview(labelView)
        addSubview(arrow)
        [
            arrow.heightAnchor.constraint(equalToConstant: 22.0),
            arrow.widthAnchor.constraint(equalToConstant: 14.0),
            arrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.0),
            arrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            labelView.topAnchor.constraint(equalTo: topAnchor),
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: arrow.leadingAnchor, constant: -15.0),
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ].forEach{ $0.isActive = true }
    }
}
