//
//  CalculatorViewController.swift
//  MyCalculator
//
//  Created by Zengxihuan on 5/29/18.
//  Copyright © 2018 xihuanzneg. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    // LifeCycle function
    override func viewDidLoad() {
        initAll()
    }
    
    //Outlet
    @IBOutlet weak var screen: UILabel!
    
    //Variables
    var enteringNumber = false
    var operand = [Double]()
    var calModel: CalModel?
    
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
    
    @IBAction func initAll() {
        screenValue = 0.0
        enteringNumber = false
        calModel = CalModel()
    }

    @IBAction func operationPressed(_ sender: UIButton) {
        enteringNumber = false
        
        equals()
        
        do {
            try calModel?.appendOperation(op1: screenValue, operatonSymbol: sender.currentTitle!)
        }
        catch CalModel.OperationError.UnrecognizedOperationError(let errorMessage){
            print(errorMessage)
        }
        catch {
            print("executeOperation other exception \(error)")
        }
    }
    
    
    @IBAction func equals() {
        do {
            try screenValue = (calModel?.executeOperation(op2: screenValue))!
            enteringNumber = false
        }
        catch CalModel.OperationError.NotEnoughOperation {
            print ("do not have operations to run")
        }
        catch {
            print("executeOperation other exception \(error)")
        }
    }
}
