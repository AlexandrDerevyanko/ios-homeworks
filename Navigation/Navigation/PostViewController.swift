//
//  PostViewController.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 07.11.2022.
//

import UIKit



class PostViewController: UIViewController {
    
    var source = Post(title: "Some title")
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "First Text"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Загрузка вью
    override func loadView() {
        super.loadView()
        print(#function)
    }
    
    // срабатывает каждый раз при заходе на экран
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    // срабатывает каждый раз после загрузки вью
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }

    // срабатывает после загрузки вью
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        view.backgroundColor = .cyan
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        
        titleLabel.text = source.title
        setupConstraints()
//        let subView = UIView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 200))
//
//        let subBrownView = UIView(frame: CGRect(x: 50, y: 100, width: 70, height: 70))
//
//        subBrownView.backgroundColor = .blue
//        subView.backgroundColor = .red
//        view.addSubview(subView)
//        subView.addSubview(subBrownView)
    }
    
    // срабатывает перед тем как контроллер закроется
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    // срабатывает после того как контроллер закроется
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    // срабатывает при развороте экрана
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }
    
    // при удалении контроллера из памяти
    deinit {
        print(#function)
    }
    
    func setupConstraints() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
