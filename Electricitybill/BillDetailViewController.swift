//
//  BillDetailViewController.swift
//  Electricitybill
//
//  Created by MacStudent on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit
protocol PassDataProtocol
{
    func setTotal(totalBill: Double)
}

class BillDetailViewController: UIViewController
{
    @IBOutlet weak var txtcustomerName: UILabel!
    @IBAction func btnBack(_ sender: UIButton)
    {
         performSegue(withIdentifier: "ElectricityBillViewController", sender: self)
    }
    @IBOutlet weak var txttotalBill: UILabel!
    @IBOutlet weak var txtgender: UILabel!
    var electricitybill : ElectricityBill!
    var delegate: PassDataProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let bill = electricitybill
        {
            print(bill.customerName!)
            calculateTotalBillAmount()
            
            self.txtcustomerName.text = electricitybill.customerName
            self.txtgender.text = electricitybill.gender?.rawValue
            self.txttotalBill.text = String(format: "Total %.2f",  electricitybill.totalBillAmount!)
        }
        
    }
    
    @IBAction func btnLogOut(_ sender: Any)
    {
        performSegue(withIdentifier: "showloginscreen", sender: self)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func calculateTotalBillAmount()
    {
        
        var totalBill = 0.0
        
        if(electricitybill?.unitConsumed)! <= 100
            
        {
            totalBill = Double((electricitybill?.unitConsumed)!) * 0.75
        }
            
        else if (electricitybill?.unitConsumed)! <= 250
        {
            totalBill = 75 + (Double((electricitybill?.unitConsumed)!) - 100) * 1.25
        }
            
        else if (electricitybill?.unitConsumed)! <= 450
        {
            totalBill = 262.2 + (Double((electricitybill?.unitConsumed)!) - 250) * 1.75
        }
        else
        {
            totalBill = 612.5 + (Double((electricitybill?.unitConsumed)!) - 450) * 2.25
        }
        electricitybill.totalBillAmount = totalBill
        delegate?.setTotal(totalBill: totalBill)
        print( totalBill)
    }
}
