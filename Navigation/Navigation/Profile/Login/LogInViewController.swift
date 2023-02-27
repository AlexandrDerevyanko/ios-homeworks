
import UIKit

class LogInViewController: UIViewController {
    
    var loginDelegate: LoginViewControllerDelegate?
    
    private let viewModel: LogInViewModelProtocol
    
    init(viewModel: LogInViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
    private let logInButton: BlueButton = {
        let button = BlueButton()
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
    
    private let checkButton: BlueButton = {
        let button = BlueButton()
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
        scrollView.addSubview(logInButton)
//        scrollView.addSubview(checkButton)
        stackView.addArrangedSubview(logInTextFiled)
        stackView.addArrangedSubview(point)
        stackView.addArrangedSubview(passwordTextFiled)
        setupButton()
        setupGestures()
    }
        
    private func setupButton() {
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        checkButton.addTarget(self, action: #selector(checkButtonPressed), for: .touchUpInside)
        }
        
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
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
            
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leftAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            logInButton.rightAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
//            checkButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16),
//            checkButton.heightAnchor.constraint(equalToConstant: 50),
//            checkButton.leftAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
//            checkButton.rightAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16)
        
        ])
    }
    
//    func bruteForce(passwordToUnlock: String) {
//        let ALLOWED_CHARACTERS:   [String] = String().printable.map { String($0) }
//
//        var password: String = ""
//
//        // Will strangely ends at 0000 instead of ~~~
//        while password != passwordToUnlock { // Increase MAXIMUM_PASSWORD_SIZE value for more
//            password = generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)
//            // Your stuff here
////            print(password)
//            // Your stuff here
//        }
//
//        print(password)
//    }
        
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboeardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboeardRectangle.height
                
            let loginButtonBottomPointY = self.logInButton.frame.origin.y + self.logInButton.frame.height
            let keyboardOriginY = self.view.frame.height - keyboardHeight
                
            let yOffset = keyboardOriginY < loginButtonBottomPointY ? loginButtonBottomPointY - keyboardOriginY + 16 : 0
                
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
        
    @objc private func didHideKeyboard (_ notification: Notification) {
        self.forcedHidingKeyboard()
    }
        
    @objc private func logInButtonPressed() {
        pressed()
    }
    
    @objc private func checkButtonPressed() {
//        bruteForce(passwordToUnlock: "1234")
    }
        
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }
    
}

extension LogInViewController {
    func pressed() {
        let service = CurrentUserService()
        if let logIn = loginDelegate?.check(logIn: logInTextFiled.text ?? "", password: passwordTextFiled.text ?? "") {
            let user = service.checkUser(with: logIn)
            viewModel.pressed(viewInput: .logInButtonPressed(user ?? User(logIn: "", fullName: "", avatar: UIImage(), status: "")))
        } else {
            let alert = UIAlertController(title: "Unknown login or password", message: "Please, enter correct user login and password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true)
        }
        
    }
}


//extension String {
//    var digits:      String { return "0123456789" }
//    var lowercase:   String { return "abcdefghijklmnopqrstuvwxyz" }
//    var uppercase:   String { return "ABCDEFGHIJKLMNOPQRSTUVWXYZ" }
//    var punctuation: String { return "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~" }
//    var letters:     String { return lowercase + uppercase }
//    var printable:   String { return digits + letters + punctuation }
//
//
//
//    mutating func replace(at index: Int, with character: Character) {
//        var stringArray = Array(self)
//        stringArray[index] = character
//        self = String(stringArray)
//    }
//}
//
//func indexOf(character: Character, _ array: [String]) -> Int {
//    return array.firstIndex(of: String(character))!
//}
//
//func characterAt(index: Int, _ array: [String]) -> Character {
//    return index < array.count ? Character(array[index])
//                               : Character("")
//}
//
//func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
//    var str: String = string
//
//    if str.count <= 0 {
//        str.append(characterAt(index: 0, array))
//    }
//    else {
//        str.replace(at: str.count - 1,
//                    with: characterAt(index: (indexOf(character: str.last!, array) + 1) % array.count, array))
//
//        if indexOf(character: str.last!, array) == 0 {
//            str = String(generateBruteForce(String(str.dropLast()), fromArray: array)) + String(str.last!)
//        }
//    }
//
//    return str
//}
