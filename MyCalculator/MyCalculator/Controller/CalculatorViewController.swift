//
//  CalculatorViewController.swift
//  MyCalculator
//
//  Created by Zengxihuan on 5/29/18.
//  Copyright © 2018 xihuanzneg. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    //Outlet
    @IBOutlet weak var screen: UILabel!
    
    //Variables
    var enteringNumber = false
    var operand = [Double]()
    
    //Computed Property
    var screenValue: Double{
        get {
            return Double(screen.text!)!
        }
        set {
            screen.text = String(newValue)
        }
    }
    
    //Actions
    @IBAction func numberPressed(_ sender: UIButton) {
        if enteringNumber {
            screen.text!.append(sender.currentTitle!)
        }
        else {
            screen.text = sender.currentTitle
            enteringNumber = true
        }
    }
    
    @IBAction func initAll(_ sender: UIButton) {
        screenValue = 0.0
        enteringNumber = false
    }

    @IBAction func operationPressed(_ sender: UIButton) {
        
        enteringNumber = false
        if operand.count < 1 {
            operand.append(screenValue)
            print("Not enough operand")
            return
        }
        switch sender.currentTitle! {
        case "+":
            screenValue = operand.popLast()! + screenValue
        default:
            print("Cannot recognize operation")
        }
    }
    
    
}
