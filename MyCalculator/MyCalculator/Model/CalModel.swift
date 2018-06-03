//
//  File.swift
//  MyCalculator
//
//  Created by Zengxihuan on 6/3/18.
//  Copyright © 2018 xihuanzneg. All rights reserved.
//

import Foundation

class CalModel {
    // Error Handler
    // this is static
    enum OperationError: Error {
        case UnrecognizedOperationError(String)
        case NotEnoughOperation()
    }
    
    private var _opeations = [(Double) -> Double]()
    
    // Operation, several ways of writing anonymous functions
    func appendOperation(op1: Double, operatonSymbol: String) throws {
        switch operatonSymbol {
        case "+":
            _opeations.append({(op2: Double) -> Double in return op1 + op2})
        case "-":
            _opeations.append({(op2: Double) -> Double in op1 - op2})
        case "×":
            _opeations.append({op1 * $0})
        case "÷":
            _opeations.append({op1 / $0})
        default:
            print(operatonSymbol)
            throw OperationError.UnrecognizedOperationError("can not recognize the operations")
        }
    }
    
    func executeOperation(op2: Double) throws -> Double {
        // note that operation is an optional type, "if let" will unwrap this one and
        // if operation is null, it will go to else
        if let operation = _opeations.popLast() {
            return operation(op2)
        } else {
            throw OperationError.NotEnoughOperation()
        }
    }
}
