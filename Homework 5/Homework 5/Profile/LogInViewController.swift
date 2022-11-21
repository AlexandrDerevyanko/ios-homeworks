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
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
        view.addSubview(stackView)
        
    }
    func setupUI() {
        view.addSubview(logo)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
        logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logo.heightAnchor.constraint(equalToConstant: 100),
        logo.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
}
