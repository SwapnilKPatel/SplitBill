//
//  User.swift
//  SplitMyBill
//
//  Created by Ravi Chokshi on 03/08/19.
//  Copyright © 2019 Swapnil Patel. All rights reserved.
//

import Foundation





class  Firend {
    var name : String!
   
    var perPersonAmount : Double!
    var youContruBution : Double!
    var willGet : Double?
    var willGive : Double?
    var whoWhillGive = [YouOwn]()
    init(name : String?,perPersonAmount : Double! , youContruBution : Double? ,willGet : Double? ,willGive :  Double?, whoWhillGive : [YouOwn]?) {
        self.name = name
        self.perPersonAmount = perPersonAmount
        self.youContruBution = youContruBution
        self.willGet = willGet
        self.willGive = willGive
        self.whoWhillGive = whoWhillGive!
        
    }
}
struct YouOwn {
    // YOU WILL GIVE
    let amount : Double!
    let name : String!
}
struct Ownyou {
    
    //I WILL GET
    let amount : Double!
    let name : String!
}
