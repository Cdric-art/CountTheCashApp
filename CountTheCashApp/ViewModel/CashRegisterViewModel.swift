//
//  CashRegisterModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 18/01/2023.
//

import Foundation

enum TYPE_PAYEMENT {
	case CBEMV
	case CBLESS
	case AMEX
	case AMEXLESS
	case TICKETRESTAURANT
	case CASH
}

class CashRegisterViewModel: ObservableObject {
	
	@Published var firstRapport: Double?
	@Published var secondRapport: Double?
	
	@Published var cb_emv: [String] = [""]
	@Published var cb_less: [String] = [""]
	@Published var amex: [String] = [""]
	@Published var amex_less: [String] = [""]
	@Published var ticketRestaurant: [String] = [""]
	@Published var cash: [String] = [""]
	
	@Published var totalCbEmv: Double = 0
	@Published var totalCbLess: Double = 0
	@Published var totalAmex: Double = 0
	@Published var totalAmexLess: Double = 0
	@Published var totalTicketRestaurant: Double = 0
	@Published var totalCash: Double = 0
	
	
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
			case .CASH:
				totalCash = arrayStringToDouble(from: cash)
		}
	}
	
	func resultTotal() -> Double {
		return totalCbEmv + totalCbLess + totalAmex + totalAmexLess + totalTicketRestaurant + totalCash
	}
	
	func totalRapport() -> Double {
		let totalRapport = (firstRapport ?? 0) + (secondRapport ?? 0)
		return totalRapport
	}
	
	func diff() -> Double {
		let total = resultTotal() - totalRapport()
		return total
	}
	
	func isPositiveDiff()  -> Bool {
		return diff() > 0
	}
	
	private func arrayStringToDouble(from: [String]) -> Double {
		var arrDouble: [Double] = []
		
		for i in from.indices {
			arrDouble.append(Double(from[i]) ?? 0)
		}
		
		return arrDouble.reduce(0, +)
	}
}
