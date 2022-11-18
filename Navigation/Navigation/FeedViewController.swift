//
//  FeedViewController.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 06.11.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var dataSource = FeedModel(title: "Some Title", description: "Some description")
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "First Text"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("New post", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButton()
    }
    
    func setupButton() {
        button.addTarget(self, action: #selector(tapOnBlueButton), for: .touchUpInside)
    }
    
    @objc
    func tapOnBlueButton() {
        let exampleController = PostViewController()
        navigationController?.pushViewController(exampleController, animated: true)
    }
    
    func setupUI() {
        setupConstraints()
        titleLabel.text = dataSource.title
        descriptionLabel.text = dataSource.description
        view.backgroundColor = .white
    }
    
    func setupConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),

            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}
