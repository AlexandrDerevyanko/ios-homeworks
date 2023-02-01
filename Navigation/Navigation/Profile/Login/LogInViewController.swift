
import UIKit

class LogInViewController: UIViewController {
    
    private let alertController = UIAlertController(title: "Error", message: "invalid username", preferredStyle: .alert)
    
    private let point: UIView = {
        let point = UIView()
        point.backgroundColor = .lightGray
        point.translatesAutoresizingMaskIntoConstraints = false
        return point
    }()
    
    private let logo: UIImageView = {
        let myView = UIImageView()
        myView.image = UIImage(named: "logo")!
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
        
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
        
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private let logInTextFiled: TextFieldWithPadding = {
        let logIn = TextFieldWithPadding()
        logIn.tag = 0
        logIn.textColor = .black
        logIn.backgroundColor = .systemGray6
        logIn.font = UIFont.systemFont(ofSize: 16)
        logIn.placeholder = "Email or phone"
        logIn.autocapitalizationType = .none
        logIn.translatesAutoresizingMaskIntoConstraints = false
        return logIn
        }()
        
    private let passwordTextFiled: TextFieldWithPadding = {
        let password = TextFieldWithPadding()
        password.tag = 1
        password.textColor = .black
        password.backgroundColor = .systemGray6
        password.font = UIFont.systemFont(ofSize: 16)
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.autocapitalizationType = .none
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
        }()
        
    private let button: CustomButton = {
        let button = CustomButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 72/255, green: 133/255, blue: 204/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(logo)
        scrollView.addSubview(button)
        stackView.addArrangedSubview(logInTextFiled)
        stackView.addArrangedSubview(point)
        stackView.addArrangedSubview(passwordTextFiled)
        setupButton()
        setupGestures()
        setupAlertConfiguration()
    }
        
    private func setupButton() {
        button.addTarget(self, action: #selector(tapOnBlueButton), for: .touchUpInside)
        }
        
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func setupAlertConfiguration() {
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate( [
        
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            logInTextFiled.heightAnchor.constraint(equalToConstant: 49),
            
            passwordTextFiled.heightAnchor.constraint(equalToConstant: 49),
            
            point.heightAnchor.constraint(equalToConstant: 0.45),
            point.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            point.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -16)
        
        ])
        
    }
        
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboeardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboeardRectangle.height
                
            let loginButtonBottomPointY = self.button.frame.origin.y + self.button.frame.height
            let keyboardOriginY = self.view.frame.height - keyboardHeight
                
            let yOffset = keyboardOriginY < loginButtonBottomPointY ? loginButtonBottomPointY - keyboardOriginY + 16 : 0
                
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
        
    @objc private func didHideKeyboard (_ notification: Notification) {
        self.forcedHidingKeyboard()
    }
        
    @objc private func tapOnBlueButton() {
        let logIn = logInTextFiled.text ?? " "
        let user = CurrentUserService().checkUser(with: logIn)
        let testUser = TestUserService().checkUser(with: logIn)
        #if DEBUG
        if testUser != nil {
            let vc = ProfileViewController(user: testUser ?? User(logIn: "", fullName: "", avatar: UIImage(), status: ""))
            navigationController?.pushViewController(vc, animated: true)
        } else {
            present(alertController, animated: true, completion: nil)
        }
        #else
        if user != nil {
            let vc = ProfileViewController(user: user ?? User(logIn: "", fullName: "", avatar: UIImage(), status: ""))
            navigationController?.pushViewController(vc, animated: true)
        } else {
            present(alertController, animated: true, completion: nil)
        }
        #endif
    }
        
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }
    
}
