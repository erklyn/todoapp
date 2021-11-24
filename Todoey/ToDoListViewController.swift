//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    
    let itemArray = ["Shopping","Test","IDK"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        //MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListItem", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(itemArray[indexPath.row])
        let cellSettings = tableView.cellForRow(at: indexPath)
        
        
        if cellSettings?.accessoryType == .checkmark {
            cellSettings?.accessoryType = .none
        }else{
            cellSettings?.accessoryType =  .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
        
    
}

