
import UIKit

class FeedViewController: UIViewController {
    
    class FeedModel {
        var secretWord = "alpha"
        
        func check(word: String) -> String? {
            return word == secretWord ? word : nil
        }
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
    
    private lazy var checkGuessButton = CustomButton(title: "Check", bgColor: .cyan, action: checkGuessButtonPressed)
    
    private lazy var firstButton = CustomButton(title: "Profile", bgColor: .cyan, action: firstButtonPressed)
    
    private lazy var secondButton = CustomButton(title: "Photos", bgColor: .cyan, action: secondButtonPressed)
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Feed"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray6
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupUI() {
        view.addSubview(descriptionLabel)
        view.addSubview(stackView)
        view.addSubview(textField)
        view.addSubview(checkGuessButton)
        view.addSubview(label)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        descriptionLabel.text = dataSource.description
        setupConstraints()
        setupBarButtonItem()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            checkGuessButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            checkGuessButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            checkGuessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            firstButton.widthAnchor.constraint(equalToConstant: 100),
            firstButton.heightAnchor.constraint(equalToConstant: 40),
            
            secondButton.widthAnchor.constraint(equalToConstant: 100),
            secondButton.heightAnchor.constraint(equalToConstant: 40),
            
            label.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func firstButtonPressed() {
        let profileVC = ProfileViewController(user: User(logIn: "", fullName: "", avatar: UIImage(), status: ""))
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func secondButtonPressed() {
        let photosVC = PhotosViewController()
        self.navigationController?.pushViewController(photosVC, animated: true)
    }
    
    private func checkGuessButtonPressed() {
        let feedModel = FeedViewController.FeedModel()
        if let word = feedModel.check(word: textField.text ?? "") {
            label.backgroundColor = .green
        } else {
            self.label.backgroundColor = .red
            let alert = UIAlertController(title: "Error", message: "Word entered incorrectly", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true)
        }
    }
    
    private func setupBarButtonItem() {
        let barItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(tap))
        navigationItem.rightBarButtonItem = barItem
    }
    
    @objc private func tap() {
        let infoVC = InfoViewController()
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
}
