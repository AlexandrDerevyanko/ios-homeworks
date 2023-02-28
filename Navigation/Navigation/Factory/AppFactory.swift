//
//  AppFactory.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 17.02.2023.
//

import Foundation
import UIKit

final class AppFactory {
    
    func makeModule(ofType moduleType: Module.ModuleType) -> Module {
        switch moduleType {
        case .feed:
            let viewModel = FeedViewModel()
            let view = UINavigationController(rootViewController: FeedViewController(viewModel: viewModel))
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        case .logIn:
            let viewModel = LogInViewModel()
            let loginVC = LogInViewController(viewModel: viewModel)
            loginVC.loginDelegate = MyLoginFactory().makeLoginInspector()
            let view = UINavigationController(rootViewController: loginVC)
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        case .profile:
            let viewModel = ProfileViewModel()
            let view = UINavigationController(rootViewController: ProfileViewController(viewModel: viewModel, user: User(logIn: "Corgi", fullName: "Corgi Kevin", avatar: UIImage(named: "1") ?? UIImage(), status: "I'm fine")))
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        }
    }
}
