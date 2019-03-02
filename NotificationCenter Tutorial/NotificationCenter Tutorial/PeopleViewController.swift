//
//  SecondViewController.swift
//  NotificationCenter Tutorial
//
//  Created by Anmol Parande on 3/2/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

protocol PeopleVCDelegate {
    func itemChecked(_ item:String)
    func itemUnchecked(_ item:String)
}

class PeopleViewController: UITableViewController, UITextFieldDelegate, AddCellOwner {
    
    var people:[String] = ["Max", "Ajay", "Anmol", "Vidya", "Anita", "Sam", "Sinjon", "Andrew", "Neha", "Melanie", "Varun", "Aadhrik", "Candace", "Tyler"]
    var selected:[Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    var delegate: PeopleVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.delegate = self.tabBarController?.viewControllers?[0] as? PeopleVCDelegate
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
