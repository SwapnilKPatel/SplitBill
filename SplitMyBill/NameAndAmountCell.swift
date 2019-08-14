//
//  NameAndAmountCell.swift
//  SplitMyBill
//
//  Created by Ravi Chokshi on 04/08/19.
//  Copyright © 2019 Swapnil Patel. All rights reserved.
//

import UIKit

class NameAndAmountCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
           amountTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func textFieldDidChange(textField: UITextField){
        
       // billAmount = Double(billAmountTextFiled.text!) ?? 0.0
        
        print(textField.tag)
        
    }
    
}
