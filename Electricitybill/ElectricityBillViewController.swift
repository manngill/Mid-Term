//
//  ElectricityBillViewController.swift
//  Electricitybill
//
//  Created by MacStudent on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit

class ElectricityBillViewController: UIViewController,PassDataProtocol
{
    
    @IBOutlet weak var txtcustomerId: UITextField!
    @IBOutlet weak var txtcustomerName: UITextField!
   
    @IBOutlet weak var segender: UISegmentedControl!
    @IBOutlet weak var billDate: UIDatePicker!
    @IBOutlet weak var txtunit: UITextField!
    
    @IBOutlet weak var lblTotalBill: UILabel!
    var electricitybill : ElectricityBill!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCalculateBill(_ sender: Any)
    {
        electricitybill = ElectricityBill(customerID: Int(txtcustomerId.text!), customerName: txtcustomerName.text!, gender: Gender.MALE, billDate: Date(), unitConsumed: Int(txtunit.text!), totalBillAmount: 0)
        performSegue(withIdentifier: "nv", sender: self)
    }

    func setTotal(totalBill: Double)
    {
        print("Bill = \(totalBill)")
        lblTotalBill.text = "Total Bill: $\(totalBill)"
    }
    
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destVC = segue.destination as? BillDetailViewController
        {
            print("#####  \(electricitybill)")
            destVC.electricitybill = electricitybill
             destVC.delegate = self
           
        }
        
    
    }
}
