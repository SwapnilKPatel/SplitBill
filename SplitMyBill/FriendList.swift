//
//  FriendList.swift
//  SplitMyBill
//
//  Created by Ravi Chokshi on 04/08/19.
//  Copyright © 2019 Swapnil Patel. All rights reserved.
//

import Foundation
class  FriendList {
    //0 apvana che
    //1 levana che
    //2 nothing
    var  name : String?
    var amount : Double?
    var flag : Int?
    
    init(name : String? ,amount : Double? ,flag : Int?) {
        self.name = name
        self.amount = amount
        self.flag = flag
    }
    
 }
