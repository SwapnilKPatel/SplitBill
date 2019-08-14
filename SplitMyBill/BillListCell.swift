//
//  BillListCell.swift
//  SplitMyBill
//
//  Created by Ravi Chokshi on 03/08/19.
//  Copyright © 2019 Swapnil Patel. All rights reserved.
//

import UIKit

class BillListCell: UITableViewCell {

    @IBOutlet weak var due: UILabel!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
