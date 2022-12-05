//
//  ProfileViewController.swift
//  Homework 6
//
//  Created by Aleksandr Derevyanko on 29.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .cyan
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        tableView.register(CustomHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        setupNavigationBar()
    }
    
    private var viewModel: [Post] = []

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel = [
            Post(author: "Corgi", description: "Some discription", image: "1", likes: 12, views: 100), Post(author: "Corgi", description: "Some discription", image: "2", likes: 10, views: 100), Post(author: "Corgi", description: "Some discription", image: "3", likes: 120, views: 1000), Post(author: "Corgi", description: "Some discription", image: "4", likes: 14, views: 140), Post(author: "Corgi", description: "Some discription", image: "1", likes: 12, views: 100)
        ]
        self.tableView.reloadData()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Profile"
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? CustomHeaderFooterView else { return nil }
            
            let viewModel = CustomHeaderFooterView.ViewModel(text: "Хедер таблицы")
            headerView.setup(with: viewModel)
            return headerView
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        let post = self.viewModel[indexPath.row]
        let viewModel = CustomTableViewCell.ViewModel(image: UIImage(named: "1"),
                                                      text: post.description,
                                                      indexPath: indexPath)
        cell.setup(with: viewModel)
        
        return cell
    }
}
