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
    @IBOutlet var dollarPicker : WKInterfacePicker!
    @IBOutlet var centsPicker : WKInterfacePicker!
    var currentCost = 0 as Double
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        currentCost = 0
        
        var cents: [WKPickerItem] = []
        for var num in 0...99 {
            let cent = WKPickerItem()
            cent.title = String(format: ".%02d", num)
            cents.append(cent)
        }
        self.centsPicker.setItems(cents)
        
        var dollars: [WKPickerItem] = []
        for var num in 0...1000 {
            let dollar = WKPickerItem()
            dollar.title = "\(num)"
            dollars.append(dollar)
        }
        self.dollarPicker.setItems(dollars)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func centsChanged(value : Int) {
        currentCost = ("\(floor(currentCost)).\(value)" as NSString).doubleValue
    }
    
    @IBAction func dollarsChanged(value : Int) {
        currentCost = ("\(value).\(currentCost - floor(currentCost))" as NSString).doubleValue
    }
    
    @IBAction func addTipTransition() {
        self.pushControllerWithName("AddSaleViewController", context: ["currentCost" : currentCost])
    }
}

extension Double {
    mutating func toMoney() -> String {
        return String(format: "$%.2f", self)
    }
}
