//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Aleksandr Derevyanko on 01.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        loadXibFile()
    }
    func loadXibFile() {
        if let xibView = Bundle.main.loadNibNamed("ProfileView", owner: nil)?.first as? ProfileView {
            xibView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            view.addSubview(xibView)
        }
    }
}
