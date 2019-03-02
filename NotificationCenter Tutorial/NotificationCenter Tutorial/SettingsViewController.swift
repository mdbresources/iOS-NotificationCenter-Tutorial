//
//  SecondViewController.swift
//  NotificationCenter Tutorial
//
//  Created by Anmol Parande on 3/2/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settings:[String] = ["Stay logged in", "Audio Enabled", "Track My Location", "Send Anonymous Analytics"]
    var selected:[Bool] = [false, false, false, false]
    
    var delegate: SettingsVCDelegate?
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpTableView()
        if let vc = self.tabBarController?.viewControllers?[0] as? SettingsVCDelegate {
            print("Delegate Set")
            self.delegate = vc
        }
    }
    
    func setUpTableView() {
        self.tableView = UITableView()
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
        
        self.tableView.topAnchor.constraint(equalTo: self.safeArea.topAnchor, constant: 10).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 10).isActive = true
        self.safeArea.trailingAnchor.constraint(equalTo: self.tableView.trailingAnchor, constant: 10).isActive = true
        self.safeArea.bottomAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 10).isActive = true
    }
}

extension UIViewController {
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
}

