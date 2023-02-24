//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 17.02.2023.
//

import UIKit

final class AppCoordinator: Coordinatable {
    private(set) var childCoordinators: [Coordinatable] = []

    private let factory: AppFactory

    init(factory: AppFactory) {
        self.factory = factory
    }

    func start() -> UIViewController {
        let feedCoordinator = FeedCoordinator(moduleType: .feed, factory: factory)
        let logInCoordinator = LogInCoordinator(moduleType: .logIn, factory: factory)
        let profileCoordinator = ProfileCoordinator(moduleType: .profile, factory: factory)

        let appTabBarController = AppTabBarController(viewControllers: [
            feedCoordinator.start(),
            logInCoordinator.start(),
            profileCoordinator.start()
        ])

        addChildCoordinator(feedCoordinator)
        addChildCoordinator(logInCoordinator)
        addChildCoordinator(profileCoordinator)

        return appTabBarController
    }

    func addChildCoordinator(_ coordinator: Coordinatable) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: Coordinatable) {
        childCoordinators = childCoordinators.filter { $0 === coordinator }
    }
}
