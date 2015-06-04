//
//  InterfaceController.swift
//  OnSale WatchKit Extension
//
//  Created by Ruben on 5/1/15.
//  Copyright (c) 2015 Ruben.Codes. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var OriginalCostLabel : WKInterfaceLabel!
    var currentCost = 0 as Double 
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        currentCost = 0
        OriginalCostLabel.setText("Original Price?")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func addToCostLabel(digit : Int) {
        currentCost = ("\(currentCost*10)\(digit)" as NSString).doubleValue
        OriginalCostLabel.setText(currentCost.toMoney())
    }
    
    @IBAction func zero() {
        addToCostLabel(0)
        
    }
    
    @IBAction func one() {
        addToCostLabel(1)
    }
    
    @IBAction func two() {
        addToCostLabel(2)
    }
    
    @IBAction func three() {
        addToCostLabel(3)
    }
    
    @IBAction func four() {
        addToCostLabel(4)
    }
    
    @IBAction func five() {
        addToCostLabel(5)
    }
    
    @IBAction func six() {
        addToCostLabel(6)
    }
    
    @IBAction func seven() {
        addToCostLabel(7)
    }
    
    @IBAction func eight() {
        addToCostLabel(8)
    }
    
    @IBAction func nine() {
        addToCostLabel(9)
    }
    
    @IBAction func backspace() {
        currentCost = floor(currentCost*10) / 100
        OriginalCostLabel.setText(currentCost.toMoney())
    }
    
    @IBAction func addSaleTransition() {
        self.pushControllerWithName("AddSaleViewController", context: ["currentCost" : currentCost])
    }
}

extension Double {
    mutating func toMoney() -> String {
        return String(format: "$%.2f", self)
    }
}
