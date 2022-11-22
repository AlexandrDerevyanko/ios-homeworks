//
//  LoginViewController.swift
//  Homework 5
//
//  Created by Aleksandr Derevyanko on 21.11.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let logo: UIImageView = {
        let myView = UIImageView()
        myView.image = UIImage(named: "logo")!
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
//        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logInTextFiled: UITextField = {
        let logIn = UITextField()
        logIn.borderStyle = .roundedRect
        logIn.tag = 0
        logIn.textColor = .black
        logIn.backgroundColor = .systemGray6
        logIn.font = UIFont(name: "Email or phone", size: 15)
        logIn.layer.cornerRadius = 10
        logIn.clipsToBounds = true
        logIn.layer.borderColor = UIColor.lightGray.cgColor
        logIn.layer.borderWidth = 0.5
        logIn.translatesAutoresizingMaskIntoConstraints = false
        return logIn
        }()
    
    private let passwordTextFiled: UITextField = {
        let password = UITextField()
        password.borderStyle = .roundedRect
        password.tag = 1
        password.textColor = .black
        password.backgroundColor = .systemGray6
        password.font = UIFont(name: "Password", size: 15)
        password.layer.cornerRadius = 10
        password.isSecureTextEntry = true
        password.autocapitalizationType = .none
        password.clipsToBounds = true
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
        }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.imageView = UIImage(named: "blue_pixel")
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupUI()
        let logoConstraints = self.logoConstraints()
        let scrollViewConstraints = self.scrollViewConstraints()
        let stackViewConstraints = self.stackViewConstraints()
        let buttonConstraints = self.buttonConstraints()
        NSLayoutConstraint.activate(scrollViewConstraints + stackViewConstraints + logoConstraints + buttonConstraints)
        
    }
    func setupUI() {
//        self.view.addSubview(logo)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
        self.scrollView.addSubview(logo)
        self.scrollView.addSubview(button)
        self.stackView.addArrangedSubview(logInTextFiled)
        self.stackView.addArrangedSubview(passwordTextFiled)
//        self.stackView.addArrangedSubview(button)
    }
    
    private func scrollViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingAnchor = self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingAnchor = self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomAnchor = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        return [topAnchor, leadingAnchor, trailingAnchor, bottomAnchor]
    }
    
    private func stackViewConstraints() -> [NSLayoutConstraint] {
        let centerYAnchor = self.stackView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor)
        let leftAnchor = self.stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16)
        let rightAnchor = self.stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16)
        let heightAnchor = self.stackView.heightAnchor.constraint(equalToConstant: 100)
        return [centerYAnchor, leftAnchor, rightAnchor, heightAnchor]
        
    }
    
    private func logoConstraints() -> [NSLayoutConstraint] {
            
        let topAnchor = self.logo.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120)
        let centerXAnchor = self.logo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        let heightAnchor = self.logo.heightAnchor.constraint(equalToConstant: 100)
        let widthAnchor = self.logo.widthAnchor.constraint(equalToConstant: 100)
        return [topAnchor, centerXAnchor, heightAnchor, widthAnchor]
        
    }
    
    private func buttonConstraints() -> [NSLayoutConstraint] {
        
        let topAnchor = self.button.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        let heightAnchor = self.button.heightAnchor.constraint(equalToConstant: 50)
        let leftAnchor = self.button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16)
        let rightAnchor = self.button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16)
        return [topAnchor, rightAnchor, heightAnchor, leftAnchor]
        
    }
    
}
