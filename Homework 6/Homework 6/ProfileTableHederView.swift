//
//  ProfileTableHederView.swift
//  Homework 6
//
//  Created by Aleksandr Derevyanko on 03.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
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
        
    private let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var statusText: String = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(setStatusButton)
        addSubview(statusTextField)
        addSubview(statusLabel)
        addSubview(fullNameLabel)
        addSubview(avatarImageView)

        addTargets()
        setupConstraints()
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
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
                
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
                
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 80),
            setStatusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            setStatusButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -80),
            statusLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 132),

            statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            statusTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            statusTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)

            ])
        }
}
