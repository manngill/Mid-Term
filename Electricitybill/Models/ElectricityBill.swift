//
//  ElectricityBill.swift
//  Electricitybill
//
//  Created by MacStudent on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import Foundation


enum Gender : String

{
    case MALE = "MALE"
    case FEMALE = "FEMALE"
   
}

struct ElectricityBill
    
{
    var customerID: Int?
    var customerName: String?
    var gender: Gender?
    var billDate : Date?
    var unitConsumed : Int?
    var totalBillAmount: Double?
}
