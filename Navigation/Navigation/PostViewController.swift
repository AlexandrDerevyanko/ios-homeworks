//
//  PostViewController.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 07.11.2022.
//

import UIKit



class PostViewController: UIViewController {
    
    var source = Post(title: "Some title")
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "First Text"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupUI()
    }
    
    private func setupBarButtonItem() {
        let baritem = UIBarButtonItem(image: UIImage(systemName: "folder"), style: .plain, target: self, action: #selector(tap))
        self.navigationItem.rightBarButtonItem = baritem
    }
    
    @objc private func tap() {
        let exampleController = InfoViewController()
        navigationController?.present(exampleController, animated: true)
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        titleLabel.text = source.title
        setupConstraints()
        setupBarButtonItem()
    }

    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

    }
}
