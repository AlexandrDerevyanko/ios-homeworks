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

class SecondTableViewCell: UITableViewCell {
    
}

class BlueButton: UIButton {
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

class CustomButton: UIButton {
    var buttonTitle: String
    var buttonTitleColor: UIColor
    var buttonBackgroundColor: UIColor
    var action: (() -> Void)?
    
    init(buttonTitle: String, buttonTitleColor: UIColor, buttonBackgroundColor: UIColor) {
        self.buttonTitle = buttonTitle
        self.buttonTitleColor = buttonTitleColor
        self.buttonBackgroundColor = buttonBackgroundColor
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func whenButtonIsClicked(action: @escaping () -> Void) {
            self.action = action
            self.addTarget(self, action: #selector(CustomButton.buttonTapped), for: .touchUpInside)
        }

        @objc func buttonTapped() {
            action?()
        }
    
    override func layoutSubviews() {
             super.layoutSubviews()
             setup()
         }
    
    func setup() {
        setTitle(buttonTitle, for: .normal)
        setTitleColor(buttonTitleColor, for: .normal)
        backgroundColor = buttonBackgroundColor
        layer.cornerRadius = 12
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        translatesAutoresizingMaskIntoConstraints = false
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
