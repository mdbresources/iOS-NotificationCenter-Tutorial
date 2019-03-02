//
//  SettingsVC-TableView.swift
//  NotificationCenter Tutorial
//
//  Created by Anmol Parande on 3/2/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import Foundation
import UIKit

extension PeopleViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, AddCellOwner {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == self.people.count {
            return self.getAddCell()
        } else {
            return self.normalCellAt(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == self.people.count {
            return
        }
        
        self.selected[indexPath.row] = !self.selected[indexPath.row]
        
        if self.selected[indexPath.row] {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            self.delegate?.itemChecked(self.people[indexPath.row])
        } else {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .none
            self.delegate?.itemUnchecked(self.people[indexPath.row])
        }
    }
    
    private func getAddCell() -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "AddCell") as? AddItemTableViewCell
        
        cell?.cellField?.delegate = self
        cell?.owner = self
        
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func addItem(_ item: String) {
        self.people.append(item)
        self.selected.append(false)
        self.tableView.reloadData()
    }
}

