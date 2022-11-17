//
//  ProfileHeaderView.swift
//  Homework 3
//
//  Created by Aleksandr Derevyanko on 15.11.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    private let uiView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 200, y: 100, width: 100, height: 400)
        view.backgroundColor = .red
        return view
    }()
    
    func setupUI() {
        animateView()
//        view.layer.addSublayer(layer)
        view.addSubview(uiView)
        view.addSubview(blueView)
        blueView.frame = CGRect(origin: .zero, size: view.bounds.size)
    }

    func animateView() {
        UIView.animate(withDuration: 2.7) {
            self.uiView.alpha = 0
            self.view.setNeedsLayout()
        }
    }
    
}
