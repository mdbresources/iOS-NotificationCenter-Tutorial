//
//  ListItemTableViewCell.swift
//  NotificationCenter Tutorial
//
//  Created by Anmol Parande on 3/2/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

protocol AddCellOwner {
    func addItem(_ item:String)
}

class ListItemTableViewCell: UITableViewCell {
    var cellField: UITextField?
    var addButton: UIButton?
    var owner: AddCellOwner?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if cellField == nil {
            cellField = UITextField(frame: CGRect(x: 10, y: 5, width: self.contentView.frame.width - 50, height: self.contentView.frame.height - 10))
            cellField!.borderStyle = .bezel
            self.contentView.addSubview(cellField!)
        }
        
        if addButton == nil {
            addButton = UIButton(type: .contactAdd)
            addButton!.frame = CGRect(x: self.contentView.frame.width - 40, y: 5, width: 30, height: 30)
            addButton!.addTarget(self, action: #selector(addItem), for: .touchUpInside)
            self.contentView.addSubview(addButton!)
        }
    }
    
    @objc func addItem() {
        if let text = self.cellField?.text, text != "" {
            self.owner?.addItem(text)
            self.cellField?.text = ""
            self.cellField?.resignFirstResponder()
        }
    }
}
