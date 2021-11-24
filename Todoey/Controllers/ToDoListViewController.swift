//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
   

    let defaults = UserDefaults.standard
    
    var itemArray = [TodoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newTodoItem = TodoItem()
        newTodoItem.title = "Shopping"
        itemArray.append(newTodoItem)
        
        let newTodoItem1 = TodoItem()
        newTodoItem1.title = "hello"
        itemArray.append(newTodoItem1)
        
        
        
        
        }
    
        //MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListItem", for: indexPath)
        let todoItem = itemArray[indexPath.row]
        cell.textLabel?.text = todoItem.title
        
       
        cell.accessoryType = todoItem.isChecked ? .checkmark : .none
        
        return cell
        
    }
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(itemArray[indexPath.row])
      
        itemArray[indexPath.row].isChecked = !itemArray[indexPath.row].isChecked
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        tableView.reloadData()
        
        
    }
    
        
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // Actions when UIAlert button pressed.
        
            let newTodoItem = TodoItem()
            newTodoItem.title = textField.text!
            self.itemArray.append(newTodoItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter Items Name"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert , animated: true , completion: nil)
        
        
    }
    
}


