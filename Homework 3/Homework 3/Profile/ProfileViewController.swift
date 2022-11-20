//
//  ProfileViewController.swift
//  Homework 3
//
//  Created by Aleksandr Derevyanko on 15.11.2022.
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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textColor = .black
        label.font = UIFont(name: "Arial Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let someTitle: UILabel = {
        let label = UILabel()
        label.text = "Hipster Corgi"
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
        button.setTitle("Show status", for: .normal)
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
        view.backgroundColor = .lightGray
        setupUI()
//        myView.layer.cornerRadius = myView.frame.size.width
//        myView.clipsToBounds = true
//        changeAlpha()
    }
    
    func setupUI() {
        view.addSubview(myView)
        view.addSubview(titleLabel)
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
        print("\(String(describing: secondTitle.text))!")
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text!
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            myView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myView.heightAnchor.constraint(equalToConstant: 100),
            myView.widthAnchor.constraint(equalToConstant: 100),
            
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            someTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 27),
            someTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 40),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            secondTitle.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -70),
            secondTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 132),
            
            textFiled.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -15),
            textFiled.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 132),
            textFiled.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            textFiled.heightAnchor.constraint(equalToConstant: 40)

        ])
    }
    
//    var profileHeaderView = ProfileHeaderView()
//
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        profileHeaderView.frame = view.frame
//    }

    
}

