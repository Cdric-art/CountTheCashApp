//
//  LightCalculatorViewModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 12/07/2023.
//

import Foundation

class LightCalculatorViewModel: ObservableObject {
    @Published var placeHolder: String = ""
    @Published var firstNumber: String = ""
    @Published var secondNumber: String = ""
    @Published var result: Double = 0
    
    @Published var isOperatorSelected: Bool = false
    @Published var selectedOperator: Operator = .null
    
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
