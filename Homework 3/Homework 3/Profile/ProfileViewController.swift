//
//  ProfileViewController.swift
//  Homework 3
//
//  Created by Aleksandr Derevyanko on 15.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    

    
    private let blueView = UIView()

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
        view.backgroundColor = .green
        setupUI()
    }
    
    func setupUI() {
        animateView()
//        view.layer.addSublayer(layer)
        view.addSubview(uiView)
        view.addSubview(blueView)
        blueView.frame = CGRect(origin: .zero, size: view.bounds.size)
    }
//
//    func animateView() {
//        UIView.animate(withDuration: 2.7) {
//            self.uiView.alpha = 0
//            self.view.setNeedsLayout()
//        }
//    }
//
//    func rotateViewWithAnimation() {
//        UIView.animate(withDuration: 2.7) {
//            self.uiView.transform = self.uiView.transform.rotated(by: .pi - 100)
//            self.view.setNeedsLayout()
//        } completion: { _ in
//            print("Frame - \(self.uiView.frame)")
//            print("Bounds - \(self.uiView.bounds)")
//        }
//    }
    var profileHeaderView = ProfileHeaderView()
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame
    }
    
    
}

