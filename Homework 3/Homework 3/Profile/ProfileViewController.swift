//
//  ProfileViewController.swift
//  Homework 3
//
//  Created by Aleksandr Derevyanko on 15.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    

    private let myView: UIImageView = {
        let myView = UIImageView()
        myView.image = UIImage(named: "corgi")!
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
        addTargets()
        setupConstraints()
    }
    
    func addTargets() {
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        print("\(String(describing: secondTitle.text))!")
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
            
            button.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 16),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            secondTitle.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -34),
            secondTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 132)
            

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

