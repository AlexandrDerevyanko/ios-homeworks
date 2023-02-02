//
//  UserService.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 02.02.2023.
//

import UIKit

protocol UserService {
    func checkUser (with : String) -> User?
}

class User {
    var logIn: String
    var fullName: String
    var avatar: UIImage
    var status: String
    init(logIn: String, fullName: String, avatar: UIImage, status: String) {
        self.logIn = logIn
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

class CurrentUserService: UserService {
    
    var user: User = User(logIn: "Corgi", fullName: "Corgi Kevin", avatar: UIImage(named: "1") ?? UIImage(), status: "I'm fine")
    
    func checkUser(with logIn: String) -> User? {
        return logIn == user.logIn ? user : nil
    }
    
}

class TestUserService: UserService {
    
    var user: User = User(logIn: "Tester", fullName: "Corgi Tester", avatar: UIImage(named: "sadCorgi") ?? UIImage(), status: "I'm not fine")
    
    func checkUser(with logIn: String) -> User? {
        return logIn == user.logIn ? user : nil
    }
    
}
