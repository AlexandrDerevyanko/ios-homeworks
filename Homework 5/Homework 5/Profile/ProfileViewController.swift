//
//  ProfileViewController.swift
//  Homework 5
//
//  Created by Aleksandr Derevyanko on 21.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
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

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            setupUI()
    //        myView.layer.cornerRadius = myView.frame.size.width
    //        myView.clipsToBounds = true
    //        changeAlpha()
        }
        
        func setupUI() {
            view.addSubview(myView)
            view.addSubview(someTitle)
            view.addSubview(button)
            view.addSubview(secondTitle)
            view.addSubview(textFiled)

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
        }
        
        @objc func statusTextChanged(_ textField: UITextField) {
            statusText = textField.text!
        }
        
        func setupConstraints() {
            NSLayoutConstraint.activate([
                
                myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                myView.heightAnchor.constraint(equalToConstant: 100),
                myView.widthAnchor.constraint(equalToConstant: 100),
                
                someTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                someTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                button.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 80),
                button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
                button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
                button.heightAnchor.constraint(equalToConstant: 50),
                
                secondTitle.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -80),
                secondTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 132),

                textFiled.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 20),
                textFiled.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                textFiled.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                textFiled.heightAnchor.constraint(equalToConstant: 40)

            ])
        }

    
}
