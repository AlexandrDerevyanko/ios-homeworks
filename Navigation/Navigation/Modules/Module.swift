//
//  Module.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 17.02.2023.
//

import UIKit

protocol ViewModelProtocol: AnyObject {}

struct Module {
    enum ModuleType {
        case feed
        case logIn
    }

    let moduleType: ModuleType
    let viewModel: ViewModelProtocol?
    let view: UIViewController
}

extension Module.ModuleType {
    var tabBarItem: UITabBarItem {
        switch self {
        case .feed:
            return UITabBarItem(title: "Feed", image: UIImage(systemName: "list.bullet"), tag: 0)
        case .logIn:
            return UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        }
    }
}
