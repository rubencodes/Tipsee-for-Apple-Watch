//
//  AddSaleViewController.swift
//  OnSale
//
//  Created by Ruben on 5/1/15.
//  Copyright (c) 2015 Ruben.Codes. All rights reserved.
//

import Foundation
import WatchKit

class AddSaleViewController: WKInterfaceController {
    var currentCost : Double = 0
    var newCost : Double = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        currentCost = context!.objectForKey("currentCost") as! Double
        newCost = currentCost
    }
    
    @IBAction func ten() {
        newCostWithTip(0.1)
    }
    
    @IBAction func fifteen() {
        newCostWithTip(0.15)
    }
    
    @IBAction func twenty() {
        newCostWithTip(0.2)
    }
    
    @IBAction func twentyfive() {
        newCostWithTip(0.25)
    }
    
    @IBAction func thirty() {
        newCostWithTip(0.3)
    }
    
    @IBAction func thirtyfive() {
        newCostWithTip(0.35)
    }
    
    func newCostWithTip(tip : Double) {
        newCost = currentCost * (1 + tip)
        
        self.pushControllerWithName("FinalViewController", context: ["currentCost" : newCost, "tip" : newCost - currentCost])
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}