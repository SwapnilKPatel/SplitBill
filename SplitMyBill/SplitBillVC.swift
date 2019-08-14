//
//  SplitBillVC.swift
//  SplitMyBill
//
//  Created by Ravi Chokshi on 03/08/19.
//  Copyright © 2019 Swapnil Patel. All rights reserved.
//

import UIKit

class SplitBillVC: UIViewController {

    var list = [FriendList]()
    @IBOutlet weak var split: UIButton!
    var numberOfParties = 0
    var billAmount :Double = 0.0
     @IBOutlet weak var billAmountTextFiled: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var numberParty: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       tableViewSetup()
      
        
        billAmountTextFiled.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    @IBAction func stepper(_ sender: AnyObject) {
        numberParty.text = "\(Int(stepper.value))"
        numberOfParties = Int(stepper.value)
     
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        
        billAmount = Double(billAmountTextFiled.text!) ?? 0.0
        
        print(textField.tag)
        
    }
   
    
    @IBAction func splitClicked(_ sender: Any) {
        
        self.tableView.reloadData()
    }
    @IBAction func addFriendsTapped(_ sender: Any) {
        
        alertWithTF()
    }
    func alertWithTF() {
        //Step : 1
        let alert = UIAlertController(title: "Add Friend", message: "", preferredStyle: UIAlertController.Style.alert)
        //Step : 2
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
           
            if textField.text != "" {
                //Read TextFields text data
              
                let name = FriendList.init(name: textField.text ?? " ", amount: 0.0, flag: 0)
                self.list.append(name)
                self.tableView.reloadData()
                print(textField.text!)
                print("TF 1 : \(textField.text!)")
            } else {
                print("TF 1 is Empty...")
            }
            
            
        }
        
        //Step : 3
        //For first TF
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
            textField.textColor = .red
        }
        //For second TF
       
        //Step : 4
        alert.addAction(save)
        //Cancel action
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (alertAction) in }
        alert.addAction(cancel)
        //OR single line action
        //alert.addAction(UIAlertAction(title: "Cancel", style: .default) { (alertAction) in })
        
        self.present(alert, animated:true, completion: nil)
        
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
extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

