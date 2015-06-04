//
//  TransitionViewController.swift
//  OnSale
//
//  Created by Ruben on 5/1/15.
//  Copyright (c) 2015 Ruben.Codes. All rights reserved.
//

import Foundation
import WatchKit

class FinalViewController: WKInterfaceController {
    var currentCost : Double = 0
    var tip : Double = 0
    @IBOutlet var tipLabel : WKInterfaceLabel!
    @IBOutlet var currentCostLabel : WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        currentCost = context!.objectForKey("currentCost") as! Double
        tip = context!.objectForKey("tip") as! Double
        
        currentCostLabel.setText(currentCost.toMoney())
        tipLabel.setText("We recommend a \(tip.toMoney()) tip!")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func addSaleTransition() {
        self.pushControllerWithName("AddSaleViewController", context: ["currentCost" : currentCost])
    }
    
    @IBAction func startOver() {
        self.popToRootController()
    }
}