//
//  ViewController.swift
//  iOS QuickStart To-Do List
//
//  Created by Brandon Baker on 2/24/20.
//  Copyright © 2020 Brandon Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()
    let textField = UITextField()
    var toDoList : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 35, width: self.view.frame.width, height: 30))
        titleLabel.font = .systemFont(ofSize: 24)
        titleLabel.text = "To Do List"
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        
        textField.frame = CGRect(x: 32, y: 75, width: self.view.frame.width - 64, height: 45)
        textField.placeholder = "Item"
        self.view.addSubview(textField)
        
        let addButton = UIButton(frame: CGRect(x: 32, y: 135, width: self.view.frame.width - 64, height: 45))
        addButton.backgroundColor = .systemBlue
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        self.view.addSubview(addButton)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.height - 150)
        self.view.addSubview(tableView)
        
    }
    
    @objc func addButtonPressed() {
        guard let toDoListItem = textField.text else { return }
        toDoList.append(toDoListItem)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDoListItem = toDoList[indexPath.row]
        print(selectedToDoListItem)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
}

