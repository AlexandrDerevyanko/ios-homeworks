//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 06.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        profileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileView)
        setupConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Profile"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray6
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
        
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 220)

        ])
    }
    
}
