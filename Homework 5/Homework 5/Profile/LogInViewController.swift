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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logInTextFiled: UITextField = {
        let logIn = UITextField()
        logIn.borderStyle = .roundedRect
        logIn.tag = 0
        logIn.textColor = .black
        logIn.backgroundColor = .systemGray6
<<<<<<< HEAD
<<<<<<< HEAD
        logIn.font = UIFont(name: "SystemFont", size: 16)
        logIn.placeholder = "Email or phone"
=======
        logIn.font = UIFont(name: "Email or phone", size: 15)
>>>>>>> parent of 6da4f90... some commit
=======
        logIn.font = UIFont(name: "Email or phone", size: 15)
>>>>>>> parent of 6da4f90... some commit
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
<<<<<<< HEAD
<<<<<<< HEAD
        password.font = UIFont(name: "SystemFont", size: 16)
        password.placeholder = "Password"
=======
        password.font = UIFont(name: "Password", size: 15)
>>>>>>> parent of 6da4f90... some commit
=======
        password.font = UIFont(name: "Password", size: 15)
>>>>>>> parent of 6da4f90... some commit
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
        
<<<<<<< HEAD
    }
<<<<<<< HEAD
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
=======
>>>>>>> parent of 6da4f90... some commit
=======
    }
>>>>>>> parent of 6da4f90... some commit
    func setupUI() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
        self.scrollView.addSubview(logo)
        self.scrollView.addSubview(button)
        self.stackView.addArrangedSubview(logInTextFiled)
        self.stackView.addArrangedSubview(passwordTextFiled)
<<<<<<< HEAD
<<<<<<< HEAD
        setupButton()
        setupGestures()
    }
    
    func setupButton() {
            button.addTarget(self, action: #selector(tapOnBlueButton), for: .touchUpInside)
        }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
=======
//        self.stackView.addArrangedSubview(button)
    }
    
>>>>>>> parent of 6da4f90... some commit
=======
//        self.stackView.addArrangedSubview(button)
    }
    
>>>>>>> parent of 6da4f90... some commit
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
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboeardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboeardRectangle.height
            
            let loginButtonBottomPointY = self.button.frame.origin.y + self.button.frame.height
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            
            let yOffset = keyboardOriginY < loginButtonBottomPointY ? loginButtonBottomPointY - keyboardOriginY + 16 : 0
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
    
    @objc private func didHideKeyboard (_ notification: Notification) {
        self.forcedHidingKeyboard()
    }
    
    @objc func tapOnBlueButton() {
            let profileViewController = ProfileViewController()
            navigationController?.pushViewController(profileViewController, animated: true)
        }
    
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }
    
}
