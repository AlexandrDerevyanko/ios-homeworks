//
//  classes.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 09.12.2022.
//

import UIKit

var sec = SecondPost(title: "2")

struct SecondPost {
    var title: String
}

class CustomButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            if (isHighlighted) {
                alpha = 0.8
            } else {
                alpha = 1
            }
        }
    }
    override var isSelected: Bool {
        didSet {
            if (isSelected) {
                alpha = 0.8
            } else {
                alpha = 1
            }
        }
    }
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
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

protocol UserService {
    func checkUser (with : String) -> User?
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
