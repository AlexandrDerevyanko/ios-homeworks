
import UIKit

class FeedViewController: UIViewController {
    
    private var dataSource = FeedModel(title: "Some Title", description: "Some description")
    
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("Profile", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 12
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Profile", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 12
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        setupButton()
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
    
    private func setupButton() {
        firstButton.addTarget(self, action: #selector(tapOnBlueButton), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(tapOnBlueButton), for: .touchUpInside)
    }
    
    @objc func tapOnBlueButton() {
        let exampleController = ProfileViewController(user: User(logIn: "", fullName: "", avatar: UIImage(), status: ""))
        navigationController?.pushViewController(exampleController, animated: true)
    }
    
    private func setupUI() {
        view.addSubview(descriptionLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        descriptionLabel.text = dataSource.description
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            firstButton.widthAnchor.constraint(equalToConstant: 100),
            firstButton.heightAnchor.constraint(equalToConstant: 40),
            
            secondButton.widthAnchor.constraint(equalToConstant: 100),
            secondButton.heightAnchor.constraint(equalToConstant: 40),

            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}
