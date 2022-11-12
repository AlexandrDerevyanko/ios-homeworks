//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 06.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 14
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
        button.frame = CGRect(x: 20, y: 180, width: 100, height: 50)
        setupConstraints()
    }
    
    func setupButton() {
        button.addTarget(self, action: #selector(tapOnBlueButton), for: .touchUpInside)
    }
    
    @objc
    func tapOnBlueButton() {
        let exampleController = InfoViewController()
        navigationController?.pushViewController(exampleController, animated: true)
    }
    func setupConstraints() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
}
