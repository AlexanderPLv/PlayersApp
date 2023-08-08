//
//  PlayerDetailScreen.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import UIKit

final class PlayerDetailScreen: UIViewController {
    
    var close: CompletionBlock?
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 22.0)
        view.textColor = .darkText
        view.textAlignment = .center
        return view
    }()
    
    private lazy var removeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "xmark.bin.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(didTapRemoveButton), for: .touchUpInside)
        view.tintColor = .white
        view.backgroundColor = .red
        view.layer.cornerRadius = 4.0
        return view
    }()
    
    private let viewModel: PlayerDetailViewModel
    
    init(
        viewModel: PlayerDetailViewModel
    ) {
        self.viewModel = viewModel
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
    
    @objc func didTapBackButton() -> Void {
        close?()
    }
    
    @objc func didTapRemoveButton() -> Void {
        viewModel.removePlayer()
        close?()
    }
    
    func setupViews() {
        title = "Details"
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = true
        
        setupBackButton()
        
        nameLabel.text = viewModel.player.personalInfo.name
        
        let stack = UIStackView(arrangedSubviews: [
            LabelView(title: "Age: ", text: viewModel.player.personalInfo.age.formatted()),
            LabelView(title: "Country: ", text: viewModel.player.personalInfo.country),
            LabelView(title: "Level: ", text: viewModel.player.playerStats.level.formatted()),
            LabelView(title: "Score: ", text: viewModel.player.playerStats.score.formatted()),
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10.0
        
        view.addSubview(nameLabel)
        view.addSubview(stack)
        view.addSubview(removeButton)
        [
            nameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10.0),
            nameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20.0),
            nameLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            
            stack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20.0),
            stack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20.0),
            stack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            
            removeButton.heightAnchor.constraint(equalToConstant: 48.0),
            removeButton.widthAnchor.constraint(equalToConstant: 48.0),
            removeButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20.0),
            removeButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20.0),
        ].forEach { $0.isActive = true }
        
    }
    
    func setupBackButton() {
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        backbutton.setTitle("Back", for: .normal)
        backbutton.tintColor = .black
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
    }
}
