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

class AddItemTableViewCell: UITableViewCell {
    var cellField: UITextField?
    var addButton: UIButton?
    var owner: AddCellOwner?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellField = UITextField(frame: CGRect(x: 10, y: 5, width: self.contentView.frame.width - 50, height: self.contentView.frame.height - 10))
        cellField!.borderStyle = .bezel
        self.contentView.addSubview(cellField!)
        
        addButton = UIButton(type: .contactAdd)
        addButton!.frame = CGRect(x: self.contentView.frame.width - 40, y: 5, width: 30, height: 30)
        addButton!.addTarget(self, action: #selector(addItem), for: .touchUpInside)
        self.contentView.addSubview(addButton!)
        
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addItem() {
        if let text = self.cellField?.text, text != "" {
            self.owner?.addItem(text)
            self.cellField?.text = ""
        }
        self.cellField?.resignFirstResponder()
    }
}
