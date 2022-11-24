//
//  ProfileHeaderView.swift
//  homework 4
//
//  Created by Aleksandr Derevyanko on 20.11.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let textFiled: UITextField = {
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

        private let myView: UIImageView = {
            let myView = UIImageView()
            myView.image = UIImage(named: "corgi")!
            myView.layer.cornerRadius = 50
            myView.clipsToBounds = true
            myView.layer.borderColor = UIColor.white.cgColor
            myView.layer.borderWidth = 3
            myView.translatesAutoresizingMaskIntoConstraints = false
            return myView
        }()
        
        private let someTitle: UILabel = {
            let label = UILabel()
            label.text = "Corgi"
            label.font = UIFont(name: "Arial Bold", size: 18)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let secondTitle: UILabel = {
            let label = UILabel()
            label.text = "Waiting for something"
            label.font = UIFont(name: "Arial regular", size: 14)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let button: UIButton = {
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        func setupUI() {
            addSubview(myView)
            addSubview(someTitle)
            addSubview(button)
            addSubview(secondTitle)
            addSubview(textFiled)

            addTargets()
            setupConstraints()
        }
        
        func addTargets() {
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            textFiled.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        }
        
        private var statusText: String = ""
        
        @objc func buttonPressed() {
            secondTitle.text = statusText
            print("\(String(describing: secondTitle.text))!")
        }
        
        @objc func statusTextChanged(_ textField: UITextField) {
            statusText = textField.text!
        }
        
        func setupConstraints() {
            NSLayoutConstraint.activate([
                
                myView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
                myView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                myView.heightAnchor.constraint(equalToConstant: 100),
                myView.widthAnchor.constraint(equalToConstant: 100),
                
                someTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                someTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                button.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 80),
                button.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
                button.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
                button.heightAnchor.constraint(equalToConstant: 50),
                
                secondTitle.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -80),
                secondTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 132),

                textFiled.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 20),
                textFiled.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
                textFiled.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
                textFiled.heightAnchor.constraint(equalToConstant: 40)

            ])
        }
}
