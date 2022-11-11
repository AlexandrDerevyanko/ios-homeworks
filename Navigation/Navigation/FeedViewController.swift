//
//  FeedViewController.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 06.11.2022.
//

import UIKit

struct Post {
    var title: String
}

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
        return button
    }()
    
//    private let button: UIButton = {
//        let button = UIButton()
//        button.setTitle("Show Alert", for: .normal)
//        button.setTitleColor(UIColor.black, for: .normal)
//        button.backgroundColor = .cyan
//        button.layer.cornerRadius = 14
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    // 1 Создаем алерт контроллер
    let alertController = UIAlertController(title: "Hello world", message: "Message", preferredStyle: .alert)
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButton()
        button.frame = CGRect(x: 20, y: 180, width: 100, height: 50)
    }
    
    // MARK: - Methods
    
    func setupButton() {
        button.addTarget(self, action: #selector(tapOnBlueButton), for: .touchUpInside)
    }
    
    @objc
    func tapOnBlueButton() {
        let exampleController = PostViewController()
        // 1 Иерархическая навигация
        navigationController?.pushViewController(exampleController, animated: true)
        // 2 Модальная навигация
//        navigationController?.present(exampleController, animated: true)
    }
    
    func setupUI() {
        setupAlertConfiguration()
        setupConstraints()
//        addTargets()
        
        titleLabel.text = dataSource.title
        descriptionLabel.text = dataSource.description
        
        view.backgroundColor = .white
        setupBarButtonItem()
    }
    
    // Добавление Bar button item
    func setupBarButtonItem() {
        let baritem = UIBarButtonItem(image: UIImage(systemName: "folder"), style: .plain, target: self, action: #selector(addTarget))
        self.navigationItem.rightBarButtonItem = baritem
    }
    
    // 2 Добавляем экшн
    func setupAlertConfiguration() {
        let action = UIAlertAction(title: "OK", style: .default) {_ in
            print("Bye")
        }
        alertController.addAction(action)
//        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
//           print("alert")
//        }))
    }
    
    // 3 Добавляем кнопку которая будет вызывать наш алерт контроллер
    func addTargets() {
//        button.addTarget(self, action: #selector(addTarget), for: .touchUpInside)
        button.addTarget(self, action: #selector(showDetailController), for: .touchUpInside)
    }
    
    func setupConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    // 4 добавляем метод для нажатия на кнопку
    @objc func addTarget() {
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func showDetailController() {
        let exampleViewController = PostViewController()
        navigationController?.pushViewController(exampleViewController, animated: true)
//        print(navigationController)
    }
    
}
