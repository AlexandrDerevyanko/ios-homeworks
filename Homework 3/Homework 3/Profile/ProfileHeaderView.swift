////
////  ProfileHeaderView.swift
////  Homework 3
////
////  Created by Aleksandr Derevyanko on 15.11.2022.
////
//
//import UIKit
//
//class ProfileHeaderView: UIView {
//    
//
//    private let myView: UIImageView = {
//        let myView = UIImageView()
//        myView.image = UIImage(named: "corgi")!
//        myView.translatesAutoresizingMaskIntoConstraints = false
//        return myView
//    }()
//
//    private let redView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .red
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .lightGray
//        setupUI()
////        myView.layer.cornerRadius = myView.frame.size.width
////        myView.clipsToBounds = true
////        changeAlpha()
//    }
//
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//
//            myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            myView.heightAnchor.constraint(equalToConstant: 130),
//            myView.widthAnchor.constraint(equalToConstant: 130),
//
//            redView.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 16),
//            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            redView.widthAnchor.constraint(equalToConstant: 130),
//            redView.heightAnchor.constraint(equalToConstant: 130)
//        ])
//    }
//
//    func setupUI() {
//        view.addSubview(myView)
//        view.addSubview(redView)
//        setupConstraints()
//    }
//
//    func changeAlpha() {
////        UIImageView.animate(withDuration: 3.5) {
//            self.myView.layer.cornerRadius = 20
////            self.myView.backgroundColor = .green
////        }
//    }
//
//}
