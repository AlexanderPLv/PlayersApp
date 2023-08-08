//
//  LabelView.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import UIKit

final class LabelView: UIView {
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 1
        view.textAlignment = .left
        return view
    }()
    
    private let textLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 1
        view.textAlignment = .right
        return view
    }()
    
    init(
        title: String = "",
        text: String = "",
        font: UIFont = .systemFont(ofSize: 16.0),
        color: UIColor = .black
    ) {
        self.titleLabel.text = title
        self.textLabel.text = text
        self.titleLabel.font = font
        self.textLabel.font = font
        self.titleLabel.textColor = color
        self.textLabel.textColor = color
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String, text: String) {
        self.titleLabel.text = title
        self.textLabel.text = text
    }
}

private extension LabelView {
    
    func setupView() {
        titleLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        let stack = UIStackView(arrangedSubviews: [titleLabel, textLabel])
        stack.axis = .horizontal
        stack.spacing = 20.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        [
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25.0),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25.0),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ].forEach { $0.isActive = true }
    }
}
