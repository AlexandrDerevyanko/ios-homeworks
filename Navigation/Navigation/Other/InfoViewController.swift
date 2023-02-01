//
//  InfoViewController.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 12.11.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private var source = SecondPost(title: "Some title")
    
    private let alertController = UIAlertController(title: "Hello world", message: "Message", preferredStyle: .alert)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "First Text"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupButton()
        
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(button)
        titleLabel.text = source.title
        setupConstraints()
        setupAlertConfiguration()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    private func setupButton() {
        button.addTarget(self, action: #selector(addTarget), for: .touchUpInside)
    }

    private func setupAlertConfiguration() {
        let action = UIAlertAction(title: "OK", style: .default) {_ in
            print("Bye")
        }
        let action2 = UIAlertAction(title: "Cancel", style: .cancel) {_ in
            print("Bye")
        }
        alertController.addAction(action)
        alertController.addAction(action2)

    }

    @objc private func addTarget() {
        self.present(alertController, animated: true, completion: nil)
    }

}
