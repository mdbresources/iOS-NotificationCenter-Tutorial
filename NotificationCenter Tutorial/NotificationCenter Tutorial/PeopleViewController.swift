//
//  SecondViewController.swift
//  NotificationCenter Tutorial
//
//  Created by Anmol Parande on 3/2/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    var people:[String] = ["Max", "Ajay", "Anmol", "Vidya", "Anita", "Sam", "Sinjon", "Andrew", "Neha", "Melanie", "Varun", "Aadhrik", "Candace", "Tyler"]
    var selected:[Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    var delegate: PeopleVCDelegate?
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpTableView()
        if let vc = self.tabBarController?.viewControllers?[0] as? PeopleVCDelegate {
            print("Delegate Set")
            self.delegate = vc
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func setUpTableView() {
        self.tableView = UITableView()
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(AddItemTableViewCell.self, forCellReuseIdentifier: "AddCell")
        
        self.view.addSubview(self.tableView)
        
        self.tableView.topAnchor.constraint(equalTo: self.safeArea.topAnchor, constant: 10).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 10).isActive = true
        self.safeArea.trailingAnchor.constraint(equalTo: self.tableView.trailingAnchor, constant: 10).isActive = true
        self.safeArea.bottomAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 10).isActive = true
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            print("notification: Keyboard will show")
            
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0)
            self.tableView.contentInset = contentInsets;
            self.tableView.scrollIndicatorInsets = contentInsets;
            self.tableView.scrollToNearestSelectedRow(at: .bottom, animated: true)
        }
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.tableView.contentInset = contentInsets;
        self.tableView.scrollIndicatorInsets = contentInsets;
        self.tableView.scrollToNearestSelectedRow(at: .bottom, animated: true)
    }
}

extension UIViewController {
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
}

