//
//  SettingsVC-TableView.swift
//  NotificationCenter Tutorial
//
//  Created by Anmol Parande on 3/2/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import Foundation
import UIKit

extension PeopleViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == self.people.count {
            return self.getAddCell()
        } else {
            return self.normalCellAt(indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == self.people.count {
            return
        }
        
        self.selected[indexPath.row] = !self.selected[indexPath.row]
        
        if self.selected[indexPath.row] {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            //Call the delegate method
        } else {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .none
            //Call the delegate method
        }
    }
    
    private func getAddCell() -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCell(withIdentifier: "AddCell") as? AddItemTableViewCell
        
        if cell == nil {
            cell = AddItemTableViewCell(style: .default, reuseIdentifier: "AddCell")
        }
        
        //Set appropriate delegates
        
        return cell!
    }
    
    private func normalCellAt(_ indexPath: IndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCell(withIdentifier: "Person Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Person Cell")
        }
        
        cell?.textLabel?.text = self.people[indexPath.row]
        cell?.accessoryType = (self.selected[indexPath.row]) ? .checkmark : .none
        cell?.selectionStyle = .none
        
        return cell!
    }
}

