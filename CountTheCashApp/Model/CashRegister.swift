//
//  CashRegister.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 18/01/2023.
//

import Foundation
import Observation

@Observable
class CashRegister {
    
    var firstRapport: Double?
    var secondRapport: Double?
    
    var cb_emv: [String] = [""]
    var cb_less: [String] = [""]
    var amex: [String] = [""]
    var amex_less: [String] = [""]
    var ticketRestaurant: [String] = [""]
    var expenses: [String] = [""]
    var cash: [String] = [""]
    
    var totalCbEmv: Double = 0
    var totalCbLess: Double = 0
    var totalAmex: Double = 0
    var totalAmexLess: Double = 0
    var totalTicketRestaurant: Double = 0
    var totalExpenses: Double = 0
    var totalCash: Double = 0
    
    func saveTotal(type: TYPE_PAYEMENT) {
        switch type {
            case .CBEMV:
                totalCbEmv = arrayStringToDouble(from: cb_emv)
            case .CBLESS:
                totalCbLess = arrayStringToDouble(from: cb_less)
            case .AMEX:
                totalAmex = arrayStringToDouble(from: amex)
            case .AMEXLESS:
                totalAmexLess = arrayStringToDouble(from: amex_less)
            case .TICKETRESTAURANT:
                totalTicketRestaurant = arrayStringToDouble(from: ticketRestaurant)
            case .EXPENSES:
                totalExpenses = arrayStringToDouble(from: expenses)
            case .CASH:
                totalCash = arrayStringToDouble(from: cash)
        }
    }
    
    var totalCaisse: Double {
        return totalCbEmv + totalCbLess + totalAmex + totalAmexLess + totalTicketRestaurant + totalExpenses + totalCash
    }
    
    var totalRapport: Double {
        let totalRapport = (firstRapport ?? 0) + (secondRapport ?? 0)
        return totalRapport
    }
    
    private var totaux: Double {
        return totalCaisse - totalRapport
    }
    
    var diff: String {
        return totaux.formatted(.currency(code: "EUR"))
    }
    
    var isPositiveDiff: Bool {
        return totaux > 0
    }
    
    private func arrayStringToDouble(from: [String]) -> Double {
        var arrDouble: [Double] = []
        
        for i in from.indices {
            arrDouble.append(Double(from[i]) ?? 0)
        }
        
        return arrDouble.reduce(0, +)
    }

}

enum TYPE_PAYEMENT {
    case CBEMV
    case CBLESS
    case AMEX
    case AMEXLESS
    case TICKETRESTAURANT
    case EXPENSES
    case CASH
}
