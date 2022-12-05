//
//  LogInViewController.swift
//  Homework 6
//
//  Created by Aleksandr Derevyanko on 29.11.2022.
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
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
        
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private let logInTextFiled: UITextField = {
        let logIn = UITextField()
        logIn.borderStyle = .roundedRect
        logIn.tag = 0
        logIn.textColor = .black
        logIn.backgroundColor = .systemGray6
        logIn.font = UIFont(name: "SystemFont", size: 16)
        logIn.placeholder = "Email or phone"

        logIn.autocapitalizationType = .none
        logIn.translatesAutoresizingMaskIntoConstraints = false
        return logIn
        }()
        
    private let passwordTextFiled: UITextField = {
        let password = UITextField()
        password.borderStyle = .roundedRect
        password.tag = 1
        password.textColor = .black
        password.backgroundColor = .systemGray6
        password.font = UIFont(name: "SystemFont", size: 16)
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.autocapitalizationType = .none
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
        }()
        
    private let button: CustomButton = {
        let button = CustomButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 72/255, green: 133/255, blue: 204/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(logo)
        scrollView.addSubview(button)
        stackView.addArrangedSubview(logInTextFiled)
        stackView.addArrangedSubview(passwordTextFiled)
        setupButton()
        setupGestures()
    }
        
    private func setupButton() {
            button.addTarget(self, action: #selector(tapOnBlueButton), for: .touchUpInside)
        }
        
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate( [
        
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -16),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -16)
        
        ])
        
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
    
    class CustomButton: UIButton {
        override var isHighlighted: Bool {
            didSet {
                if (isHighlighted) {
                    alpha = 0.8
                } else {
                    alpha = 1
                }
            }
        }
        override var isSelected: Bool {
            didSet {
                if (isSelected) {
                    alpha = 0.8
                } else {
                    alpha = 1
                }
            }
        }
    }
    
}
