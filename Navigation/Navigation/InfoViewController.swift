//
//  InfoViewController.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 12.11.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    var source = Post(title: "Some title")
    
    let alertController = UIAlertController(title: "Hello world", message: "Message", preferredStyle: .alert)
    
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
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupButton()
        button.frame = CGRect(x: 20, y: 180, width: 100, height: 50)
    }
    
    func setupButton() {
        button.addTarget(self, action: #selector(addTarget), for: .touchUpInside)
    }
    
    func setupAlertConfiguration() {
        let action = UIAlertAction(title: "OK", style: .default) {_ in
            print("Bye")
        }
        let action2 = UIAlertAction(title: "Cancel", style: .cancel) {_ in
            print("Bye")
        }
        alertController.addAction(action)
        alertController.addAction(action2)

    }
    
    func setupUI() {
        titleLabel.text = source.title
        setupConstraints()
        setupAlertConfiguration()

    }
    
    @objc func addTarget() {
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setupConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
