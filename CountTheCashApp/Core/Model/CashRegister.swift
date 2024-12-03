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
    
    var firstRapport: Double = 0
    var secondRapport: Double = 0
    
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
    
    private var _memoizedTotals: [TYPE_PAYEMENT: Double] = [:]
    
    func saveTotal(type: TYPE_PAYEMENT) {
        switch type {
        case .CBEMV:
            _memoizedTotals[.CBEMV] = arrayStringToDouble(from: cb_emv)
            totalCbEmv = _memoizedTotals[.CBEMV] ?? 0
        case .CBLESS:
            _memoizedTotals[.CBLESS] = arrayStringToDouble(from: cb_less)
            totalCbLess = _memoizedTotals[.CBLESS] ?? 0
        case .AMEX:
            _memoizedTotals[.AMEX] = arrayStringToDouble(from: amex)
            totalAmex = _memoizedTotals[.AMEX] ?? 0
        case .AMEXLESS:
            _memoizedTotals[.AMEXLESS] = arrayStringToDouble(from: amex_less)
            totalAmexLess = _memoizedTotals[.AMEXLESS] ?? 0
        case .TICKETRESTAURANT:
            _memoizedTotals[.TICKETRESTAURANT] = arrayStringToDouble(from: ticketRestaurant)
            totalTicketRestaurant = _memoizedTotals[.TICKETRESTAURANT] ?? 0
        case .EXPENSES:
            _memoizedTotals[.EXPENSES] = arrayStringToDouble(from: expenses)
            totalExpenses = _memoizedTotals[.EXPENSES] ?? 0
        case .CASH:
            _memoizedTotals[.CASH] = arrayStringToDouble(from: cash)
            totalCash = _memoizedTotals[.CASH] ?? 0
        }
    }
    
    var totalCaisse: Double {
        return totalCbEmv + totalCbLess + totalAmex + totalAmexLess + totalTicketRestaurant + totalExpenses + totalCash
    }
    
    var totalRapport: Double {
        let totalRapport = firstRapport + secondRapport
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
        return from.compactMap { Double($0.replacingOccurrences(of: ",", with: ".")) }.reduce(0, +)
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
