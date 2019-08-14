//
//  BillList.swift
//  SplitMyBill
//
//  Created by Ravi Chokshi on 03/08/19.
//  Copyright © 2019 Swapnil Patel. All rights reserved.
//

import UIKit

class BillList: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var amount = [Firend]()
    //var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       calculte()
        tableViewSetup()
        
        setupNavigationSideButtons()
        
        
        // Do any additional setup after loading the view.
    }
    func calculte()
    {
        let total = Double(2000)
        let numberOfFriends = Double(4)
        let perPersonAmount = total/numberOfFriends
        let number1 = Double(200.00) // 000
        let number2 = Double(600.00) // -100
        let number3 = Double(1000.00) // -500
        let number4 = Double(200.00) // 300
        
        
        
        for i in 1...Int(numberOfFriends){
            
            if i == 1 {
               
                let a = Double(perPersonAmount - number1)
                if a > 0.0 {
                    let f = Firend.init(name: "number1", perPersonAmount: perPersonAmount, youContruBution: number1, willGet: 0, willGive:  abs(a), whoWhillGive: [YouOwn]())
                    amount.append(f)
                    print("1 need to pay :",a )
                }else {
                    let f = Firend.init(name: "number1", perPersonAmount: perPersonAmount, youContruBution: number1, willGet:  abs(a), willGive: 0, whoWhillGive: [YouOwn]())
                        print("1 will get :",a )
                     amount.append(f)
                }
                
            }
            if i == 2{
                
                let a = perPersonAmount - number2
                if a > 0.0 {
                    print("2 need to pay :",a )
                    let f = Firend.init(name: "number2", perPersonAmount: perPersonAmount, youContruBution: number2, willGet: 0, willGive: abs(a), whoWhillGive: [YouOwn]())
                     amount.append(f)
                }else {
                    let f = Firend.init(name: "number2", perPersonAmount: perPersonAmount, youContruBution: number2, willGet: abs(a), willGive: 0, whoWhillGive: [YouOwn]())
                     amount.append(f)
                    print("2 will get :",a )
                }
                
            }
            if i == 3{
                
                let a = perPersonAmount - number3
                if a > 0.0 {
                    let f = Firend.init(name: "number3", perPersonAmount: perPersonAmount, youContruBution: number3, willGet: 0, willGive: abs(a), whoWhillGive: [YouOwn]())
                     amount.append(f)
                    print("3 need to pay :",a )
                }else {
                    let f = Firend.init(name: "number3", perPersonAmount: perPersonAmount, youContruBution: number3, willGet: abs(a), willGive: 0, whoWhillGive: [YouOwn]())
                     amount.append(f)
                    print("3 will get :",a )
                }
            }
            if i == 4 {
                let a = perPersonAmount - number4
                if a > 0.0 {
                    let f = Firend.init(name: "number4", perPersonAmount: perPersonAmount, youContruBution: number4, willGet: 0, willGive: abs(a), whoWhillGive: [YouOwn]())
                     amount.append(f)
                    print("4 need to pay :",abs(a) )
                }else {
                    let f = Firend.init(name: "number4", perPersonAmount: perPersonAmount, youContruBution: number4, willGet: abs(a), willGive: 0, whoWhillGive: [YouOwn]())
                     amount.append(f)
                    print("4 will get :",a )
                }
                
            }
        }
      
        
        print("per person equal :" ,perPersonAmount)
        amount.sort { (Double($0.willGive ?? 0.0) ) < (Double($1.willGive ?? 0.0) ) }

        for i in 0...amount.count - 1 {
            var a = amount[i]
            
            
            if 0.0 < a.willGet! {
                
                for i in  0...amount.count - 1 {
                    var b = amount[i]
                    
                    if b.name == a.name {
                        continue
                    }
                    
                    if b.youContruBution >= perPersonAmount {
                        
                        //Initilaise 0
                    }else {
                        
                        //How uch mony be will give
                        ///750 ma thi ketla
                        
                        let howMuchBNeedToGive = Double(perPersonAmount) - b.youContruBution!
                      
                        

                        if howMuchBNeedToGive >= a.willGet! {
                        
                            let amoutToDeduct = a.willGet!
                            
                            //1. acheck
                           
                            // b check
                            b.willGive = b.willGive! - amoutToDeduct
                            b.youContruBution = b.youContruBution + amoutToDeduct
                            
                            //rel
                            let x = YouOwn.init(amount: a.willGet, name: b.name)
                             a.willGet = 0.0
                            a.whoWhillGive.append(x)
                            
                            print(x.name)

                        }else{
                            
                            let amoutToDeduct =  howMuchBNeedToGive
                        
                            a.willGet = a.willGet! - amoutToDeduct
                            b.willGive = 0.0
                            b.youContruBution = b.youContruBution + amoutToDeduct
                            let x = YouOwn.init(amount: amoutToDeduct, name: b.name)
                            a.whoWhillGive.append(x)
                              print(x.name)

                        }

                        
                    }
                    
                    
                    
//                    if a.youOwn! >
//                        b.ownyou!{
//                         b.ownyou =  b.ownyou! -  a.youOwn!
//                        a.youOwn = 0.0
//                        let oy = YouOwn.init(amount: b.ownyou!, name: b.name)
//                        a.whoWhillGive = oy
//                    }
                    
                }
                
            }
           
            
            
        }
    }
    func setupNavigationSideButtons()
    {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        // let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(playTapped))
        
        navigationItem.rightBarButtonItems = [add]
        
        
    }
    
    @objc func addTapped(){
        print("clicked")
           let obj = SplitBillVC(nibName: "SplitBillVC", bundle: nil)
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
