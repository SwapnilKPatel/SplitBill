//
//  BillList+TableView.swift
//  SplitMyBill
//
//  Created by Ravi Chokshi on 03/08/19.
//  Copyright © 2019 Swapnil Patel. All rights reserved.
//

import Foundation
import UIKit
extension BillList :UITableViewDelegate,UITableViewDataSource{
    
    
    
    
        func tableViewSetup()  {
          
            tableView.delegate = self
            tableView.dataSource = self
            self.view.addSubview(tableView)
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
    
            tableView.backgroundColor = UIColor(red: 238/255,
                                                green: 238/255,
                                                blue: 238/255,
                                                alpha: 1)
            tableView.register(UINib(nibName: "BillListCell", bundle: nil), forCellReuseIdentifier: "BillListCell")
    
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return amount.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
            var cell = (tableView.dequeueReusableCell(withIdentifier: "BillListCell") as? BillListCell)
    
    
            cell = nil
    
            if cell == nil
    
            {
                cell = (tableView.dequeueReusableCell(withIdentifier: "BillListCell") as? BillListCell)
    
            }
    
      //   cell?.due.tag = indexPath.row
            let data  =  amount[indexPath.row]
             cell?.selectionStyle = .none
            cell?.label.text = data.name! + " " + "\(data.youContruBution ?? 0.0)"
          //  cell
//            if data.whoWhillGive.count > 0 {
//                cell?.due.text = data.whoWhillGive[1].name ?? " no 1" + " " + "\(data.whoWhillGive[1].amount ?? 0.0)" //+ " "  + "\(data.youOwn ?? 0.0)" +  "\(data.ownyou ?? 0.0)"}
//            }
            for x in data.whoWhillGive {
                
                print( data.name, "will get from" ,x.name, "" , x.amount)
            }
    
         //   cell?.configurImages(parentvc: self, dic: (data._source?.images)!)
    
            return cell!
        }
    
    
    
}
