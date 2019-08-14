//
//  SplitBill+TableView.swift
//  SplitMyBill
//
//  Created by Ravi Chokshi on 04/08/19.
//  Copyright © 2019 Swapnil Patel. All rights reserved.
//

import Foundation
//
//  BillList+TableView.swift
//  SplitMyBill
//
//  Created by Ravi Chokshi on 03/08/19.
//  Copyright © 2019 Swapnil Patel. All rights reserved.
//

import Foundation
import UIKit
extension SplitBillVC :UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    func tableViewSetup()  {
        
        tableView.delegate = self
        tableView.dataSource = self
     
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = UIColor(red: 238/255,
                                            green: 238/255,
                                            blue: 238/255,
                                            alpha: 1)
        tableView.register(UINib(nibName: "NameAndAmountCell", bundle: nil), forCellReuseIdentifier: "NameAndAmountCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = (tableView.dequeueReusableCell(withIdentifier: "NameAndAmountCell") as? NameAndAmountCell)
        
        
        cell = nil
        
        if cell == nil
            
        {
            cell = (tableView.dequeueReusableCell(withIdentifier: "NameAndAmountCell") as? NameAndAmountCell)
            
        }
        
        
        let data  =  list[indexPath.row]
        cell?.nameLabel.text = data.name
        let amount = billAmount/Double(list.count)
        cell?.amountTextField.text = String(format: "%.2f", amount)
        
        //let data  =  amount[indexPath.row]
//        cell?.selectionStyle = .none
//        cell?.label.text = data.name! + " " + "\(data.youContruBution ?? 0.0)"
//        
//        cell?.due.text = data.whoWhillGive?.name ?? " no 1" + " " + "\(data.whoWhillGive?.amount ?? 0.0)" + " "  + "\(data.youOwn ?? 0.0)" +  "\(data.ownyou ?? 0.0)"
        
        //   cell?.configurImages(parentvc: self, dic: (data._source?.images)!)
        
        return cell!
    }
    
    
    
}
