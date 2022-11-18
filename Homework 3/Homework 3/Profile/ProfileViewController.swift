//
//  ProfileViewController.swift
//  Homework 3
//
//  Created by Aleksandr Derevyanko on 15.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    

    private let myView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .blue
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
//    private let imageView = UIImageView(image: UIImage(named: "corgi")!)
    
    
//    private let blueView = UIView()

//    private let uiView: UIView = {
//        let view = UIView()
//        view.frame = CGRect(x: 200, y: 100, width: 100, height: 400)
//        view.backgroundColor = .red
//        return view
//    }()

//    private var layer: CALayer {
//        let layer2 = CALayer()
//        layer2.backgroundColor = UIColor.blue.cgColor
//        layer2.cornerRadius = 50
//        layer2.frame = CGRect(x: 70, y: 100, width: 100, height: 100)
//        return layer2
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupUI()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupUI() {
        view.addSubview(myView)
        setupConstraints()

    }
//    var profileHeaderView = ProfileHeaderView()
//
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        profileHeaderView.frame = view.frame
//    }

    
}

