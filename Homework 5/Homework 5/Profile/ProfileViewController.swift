//
//  ProfileViewController.swift
//  Homework 5
//
//  Created by Aleksandr Derevyanko on 21.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var statusText: String = ""
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let statusTextField: UITextField = {
        let fText = UITextField()
        fText.borderStyle = .roundedRect
        fText.contentVerticalAlignment = .center
        fText.textColor = .black
        fText.font = UIFont(name: "Arial regular", size: 15)
        fText.layer.cornerRadius = 12
        fText.clipsToBounds = true
        fText.layer.borderColor = UIColor.black.cgColor
        fText.layer.borderWidth = 1
        fText.translatesAutoresizingMaskIntoConstraints = false
        return fText
    }()

    private let avatarImageView: UIImageView = {
        let myView = UIImageView()
        myView.image = UIImage(named: "corgi")!
        myView.layer.cornerRadius = 50
        myView.clipsToBounds = true
        myView.layer.borderColor = UIColor.white.cgColor
        myView.layer.borderWidth = 3
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
            
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Corgi"
        label.font = UIFont(name: "Arial Bold", size: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
            
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something"
        label.font = UIFont(name: "Arial regular", size: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
            
    private let setStatusButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .blue
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Profile"
        NotificationCenter.default.addObserver(self, selector: #selector(didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray6
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
        
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(setStatusButton)
        scrollView.addSubview(statusTextField)
        scrollView.addSubview(statusLabel)
        scrollView.addSubview(fullNameLabel)
        scrollView.addSubview(avatarImageView)
        addTargets()
        setupConstraints()
        setupGestures()
    }
            
    func addTargets() {
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }
                        
    @objc func buttonPressed() {
        statusLabel.text = statusText
        print("\(String(describing: statusLabel.text))!")
    }
            
    @objc func statusTextChanged(_ statusTextField: UITextField) {
        statusText = statusTextField.text!
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboeardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboeardRectangle.height
                
            let loginButtonBottomPointY = self.setStatusButton.frame.origin.y + self.setStatusButton.frame.height
            let keyboardOriginY = self.view.frame.height - keyboardHeight
                
            let yOffset = keyboardOriginY < loginButtonBottomPointY ? loginButtonBottomPointY - keyboardOriginY + 16 : 0
                
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
        
    @objc private func didHideKeyboard (_ notification: Notification) {
        self.forcedHidingKeyboard()
    }
    
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }
            
    func setupConstraints() {
        NSLayoutConstraint.activate([
                    
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            avatarImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
                    
            fullNameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            fullNameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -80),
            statusLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 132),
            
            statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            statusTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20),
            statusTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -20),
            statusTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
                    
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 80),
            setStatusButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            setStatusButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

        ])
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
