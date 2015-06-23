//
//  ViewController.swift
//  Tipsee
//
//  Created by Ruben on 5/3/15.
//  Copyright (c) 2015 Ruben.Codes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationBarDelegate {
    @IBOutlet var OriginalCostLabel : UITextField!
    @IBOutlet var backspaceButton : UIButton!
    var originalCost : Double = 0
    var currentCost : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //make sure uibutton image doesn't stretch
        backspaceButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName : UIFont(name: "Marck Script", size: 32)!]
    }
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition  {
        return UIBarPosition.TopAttached
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToCostLabel(sender : UIButton) {
        let digit  = sender.tag
        originalCost = ("\(originalCost*10)\(digit)" as NSString).doubleValue
        currentCost = originalCost
        OriginalCostLabel.text = originalCost.toMoney()
    }
    
    @IBAction func backspace() {
        originalCost = floor(originalCost*10) / 100
        currentCost = originalCost
        OriginalCostLabel.text = originalCost.toMoney()
    }
    
    @IBAction func addTip(sender: UIButton) {
        let alert = UIAlertController(title: "Add Tip", message: "What percent tip would you like to add?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let tip10 = UIAlertAction(title: "10%", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.presentNewCostWithTip(0.10)
        }
        
        let tip15 = UIAlertAction(title: "15%", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.presentNewCostWithTip(0.15)
        }
        
        let tip20 = UIAlertAction(title: "20%", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.presentNewCostWithTip(0.20)
        }
        
        let tip25 = UIAlertAction(title: "25%", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.presentNewCostWithTip(0.25)
        }
        
        let tip30 = UIAlertAction(title: "30%", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.presentNewCostWithTip(0.30)
        }
        
        let tip35 = UIAlertAction(title: "35%", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.presentNewCostWithTip(0.35)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alert.addAction(tip10)
        alert.addAction(tip15)
        alert.addAction(tip20)
        alert.addAction(tip25)
        alert.addAction(tip30)
        alert.addAction(tip35)
        alert.addAction(cancel)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func presentNewCostWithTip(tip: Double) {
        self.currentCost = originalCost * (1 + tip)
        var difference = (self.currentCost - self.originalCost)
        
        let newCostAlert = UIAlertController(title: "Leave a \(difference.toMoney()) Tip", message: "Your new total with a \(Int(tip * 100))% tip is \(self.currentCost.toMoney()). Would you like to try a different tip size, or start over?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let startOver = UIAlertAction(title: "Start Over", style: UIAlertActionStyle.Destructive, handler: { (action) -> Void in
            self.originalCost = 0
            self.currentCost = 0
            self.OriginalCostLabel.text = self.currentCost.toMoney()
            newCostAlert.dismissViewControllerAnimated(true, completion: nil)
        })
        
        let addTip = UIAlertAction(title: "Different Tip Size", style: UIAlertActionStyle.Default, handler: {
            (action) -> Void in
            self.addTip(UIButton())
        })
        
        newCostAlert.addAction(startOver)
        newCostAlert.addAction(addTip)
        
        self.presentViewController(newCostAlert, animated: true, completion: nil)
    }
}

extension Double {
    mutating func toMoney() -> String {
        return String(format: "$%.2f", self)
    }
}

