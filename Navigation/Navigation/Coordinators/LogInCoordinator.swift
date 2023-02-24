//
//  LogInCoordinator.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 24.02.2023.
//

import UIKit

final class LogInCoordinator: ModuleCoordinatable {
    let moduleType: Module.ModuleType

    private let factory: AppFactory

    private(set) var module: Module?
    private(set) var childCoordinators: [Coordinatable] = []

    init(moduleType: Module.ModuleType, factory: AppFactory) {
        self.moduleType = moduleType
        self.factory = factory
    }

    func start() -> UIViewController {
        let module = factory.makeModule(ofType: moduleType)
        let viewController = module.view
        viewController.tabBarItem = moduleType.tabBarItem
        (module.viewModel as? LogInViewModel)?.coordinator = self
        self.module = module
        return viewController
    }
    
    func pushProfileViewController(forUser user: User) {
        let viewControllerToPush = ProfileViewController(viewModel: ProfileViewModel(), user: user )
        (module?.view as? UINavigationController)?.pushViewController(viewControllerToPush, animated: true)
    }
}
