//
//  PlayerListHeader.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import UIKit

final class PlayerListHeader: UICollectionReusableView {
    
    private let title: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 24.0)
        view.textColor = .black
        view.numberOfLines = 1
        view.textAlignment = .left
        return view
    }()
    
    private let labelView = LabelView(title: "Name", text: "Score", font: .systemFont(ofSize: 14), color: .lightGray)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String?) {
        self.title.text = title
    }
}

private extension PlayerListHeader {
    
    func setupView() {
        backgroundColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(title)
        addSubview(labelView)
        [
            title.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20.0),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor),
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60.0)
        ].forEach { $0.isActive = true }
    }
}
