//
//  FeedViewCoordinator.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 20.02.2023.
//

import UIKit

final class ProfileCoordinator: ModuleCoordinatable {
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
        self.module = module
        return viewController
    }
    
    func pushProfileViewController() {
        let viewControllerToPush = ProfileViewController(user: User(logIn: "Corgi", fullName: "Corgi Kevin", avatar: UIImage(named: "1") ?? UIImage(), status: "I'm fine"))
        (module?.view as? UINavigationController)?.pushViewController(viewControllerToPush, animated: true)
    }
}
