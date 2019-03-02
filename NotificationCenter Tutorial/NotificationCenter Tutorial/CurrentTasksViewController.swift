//
//  FirstViewController.swift
//  NotificationCenter Tutorial
//
//  Created by Anmol Parande on 3/2/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

protocol SettingsVCDelegate {
    func itemChecked(_ item:String)
    func itemUnchecked(_ item:String)
}

class CurrentTasksViewController: UITableViewController, SettingsVCDelegate {
    var items:[String] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (items.count == 0) {
            return 1
        } else {
            return items.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCell(withIdentifier: "Task Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Task Cell")
        }
        
        if items.count == 0 {
            cell!.textLabel?.text = "You have no tasks right now"
        } else {
            cell!.textLabel?.text = self.items[indexPath.row]
        }
        
        return cell!
    }
    
    func itemChecked(_ item: String) {
        print("Checked Item: \(item)")
        self.items.append(item)
        self.tableView.reloadData()
    }
    
    func itemUnchecked(_ item: String) {
        print("Unchecked Item: \(item)")
        self.items = self.items.filter({$0 != item})
        self.tableView.reloadData()
    }
}

