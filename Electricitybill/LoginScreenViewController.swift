//
//  LoginScreenViewController.swift
//  Electricitybill
//
//  Created by MacStudent on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController
{
    
    @IBOutlet weak var txtuserEmail: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    var userDefault: UserDefaults?
    
    @IBOutlet weak var Swtchremember: UISwitch!
    @IBAction func btnlogin(_ sender: Any)
    
    {
        if txtuserEmail.text == "admin" && txtpassword.text == "1234"
        {
            userDefault?.setValue(txtuserEmail.text, forKey: "email")
            userDefault?.setValue(txtpassword.text, forKey: "password")
            performSegue(withIdentifier: "ElectricityBillViewController", sender: self)

        }
        else
        
        {
            print("Invalid Email and Password")
        }
        
    }
    
   
    override func viewDidLoad(){
        super.viewDidLoad()
        userDefault = UserDefaults.standard
        
        if let userEmail = userDefault?.value(forKey: "email")
        {
            txtuserEmail.text = userEmail as? String
        }
        // Do any additional setup after loading the view.
     if let password = userDefault?.value(forKey: "password")
     {
        txtpassword.text = password as? String
        
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
