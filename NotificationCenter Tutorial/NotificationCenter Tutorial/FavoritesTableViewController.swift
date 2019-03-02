//
//  FirstViewController.swift
//  NotificationCenter Tutorial
//
//  Created by Anmol Parande on 3/2/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    var favorites:[String] = []

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (favorites.count == 0) {
            return 1
        } else {
            return favorites.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCell(withIdentifier: "Favorite Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Favorite Cell")
        }
        
        if favorites.count == 0 {
            cell?.textLabel?.text = "You Hate Everyone"
            cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        } else {
            cell?.textLabel?.font = UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .regular)
            cell?.textLabel?.text = self.favorites[indexPath.row]
        }
        
        return cell!
    }
    
    //Implement delegate methods
}

