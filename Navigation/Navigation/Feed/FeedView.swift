//
//  FeedView.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 17.02.2023.
//

import UIKit

protocol FeedViewDelegate: AnyObject {
    func profileButtonPressed()
    func photosButtonPressed()
}

class FeedView: UIView {
    
    private weak var delegate: FeedViewDelegate?
    
    init(delegate: FeedViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var dataSource = Feed(title: "Some Title", description: "Some description")

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var firstButton = CustomButton(title: "Profile", bgColor: .cyan, action: profileButtonPressed)
    private lazy var secondButton = CustomButton(title: "Photos", bgColor: .cyan, action: photosButtonPressed)
    private lazy var checkGuessButton = CustomButton(title: "Check", bgColor: .cyan, action: checkGuessButtonPressed)
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(descriptionLabel)
        addSubview(stackView)
        addSubview(textField)
        addSubview(label)
        addSubview(checkGuessButton)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        descriptionLabel.text = dataSource.description
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40),
        
            checkGuessButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            checkGuessButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            checkGuessButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            firstButton.widthAnchor.constraint(equalToConstant: 100),
            firstButton.heightAnchor.constraint(equalToConstant: 40),
            
            secondButton.widthAnchor.constraint(equalToConstant: 100),
            secondButton.heightAnchor.constraint(equalToConstant: 40),
            
            label.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func profileButtonPressed() {
        delegate?.profileButtonPressed()
    }
    
    func photosButtonPressed() {
        delegate?.photosButtonPressed()
    }
    
    func checkGuessButtonPressed() {
        if let word = FeedViewModel().check(word: textField.text ?? "") {
            label.backgroundColor = .green
        } else {
            self.label.backgroundColor = .red
            let alert = UIAlertController(title: "Error", message: "Word entered incorrectly", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.window?.rootViewController?.present(alert, animated: true)
        }
    }
    
}
