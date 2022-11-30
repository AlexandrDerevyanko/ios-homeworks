//
//  ProfileViewController.swift
//  Homework 6
//
//  Created by Aleksandr Derevyanko on 29.11.2022.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    private let table: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        view.addSubview(table)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.rightAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
        
    }
    
}
