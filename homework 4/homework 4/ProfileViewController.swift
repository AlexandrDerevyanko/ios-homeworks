//
//  ProfileViewController.swift
//  homework 4
//
//  Created by Aleksandr Derevyanko on 20.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileHeaderView()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .lightGray
            profileView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(profileView)
            setupConstraints()
        }

        func setupConstraints() {
            NSLayoutConstraint.activate([
                profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            ])
        }
    
}
