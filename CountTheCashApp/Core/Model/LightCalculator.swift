//
//  LightCalculator.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 12/07/2023.
//

import Foundation
import Observation

@Observable
class LightCalculator {
    var placeHolder: String = ""
    var firstNumber: String = ""
    var secondNumber: String = ""
    var result: Double = 0
    
    var isOperatorSelected: Bool = false
    var selectedOperator: Operator = .null
    
    func saveNumber(value: String) {
        if !isOperatorSelected {
            firstNumber.append(value)
        } else {
            secondNumber.append(value)
        }
    }
    
    func calcul() {
        switch selectedOperator {
            case .addition:
                result = (Double(firstNumber) ?? 0) + (Double(secondNumber) ?? 0)
            case .subtraction:
                result = (Double(firstNumber) ?? 0) - (Double(secondNumber) ?? 0)
            case .null:
                return
        }
    }
    
    func reset() {
        firstNumber = ""
        secondNumber = ""
        result = 0
        placeHolder = ""
        isOperatorSelected = false
    }
}


enum Operator {
    case addition, subtraction, null
}
