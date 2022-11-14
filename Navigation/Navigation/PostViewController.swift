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
        print(#function)
        view.backgroundColor = .cyan
        setupUI()
    }
    
    func setupBarButtonItem() {
        let baritem = UIBarButtonItem(image: UIImage(systemName: "folder"), style: .plain, target: self, action: #selector(tap))
        self.navigationItem.rightBarButtonItem = baritem
    }
    
    @objc
    func tap() {
        let exampleController = InfoViewController()
        navigationController?.present(exampleController, animated: true)
    }
    
    func setupUI() {
        
        titleLabel.text = source.title
        setupConstraints()
        setupBarButtonItem()
    }

    
    func setupConstraints() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

    }

}
