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
        case .profile:
            let logInVC = LogInViewController()
            logInVC.loginDelegate = MyLoginFactory().makeLoginInspector()
            let view = UINavigationController(rootViewController: logInVC)
            return Module(moduleType: moduleType, viewModel: nil, view: view)
        }
    }
}
