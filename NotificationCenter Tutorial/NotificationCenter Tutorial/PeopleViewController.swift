//
//  SecondViewController.swift
//  NotificationCenter Tutorial
//
//  Created by Anmol Parande on 3/2/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

//Create delegate for PeopleViewController

class PeopleViewController: UITableViewController, UITextFieldDelegate {
    
    var people:[String] = ["Max", "Ajay", "Anmol", "Vidya", "Anita", "Sam", "Sinjon", "Andrew", "Neha", "Melanie", "Varun", "Aadhrik", "Candace", "Tyler"]
    var selected:[Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    //Create delegate instance variable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set delegate
        
        //Observe Notifications (use the provided keyboardWillShow and keyboardWillHide notifications
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
    
    //Implement delegate methods
}
