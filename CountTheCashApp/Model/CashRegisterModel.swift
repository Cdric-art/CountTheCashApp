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
	case CASH
}

class CashRegister: ObservableObject {
	
	@Published var textFieldCashRegister: Double?
	
	@Published var cb_emv: [String] = [""]
	@Published var cb_less: [String] = [""]
	@Published var amex: [String] = [""]
	@Published var amex_less: [String] = [""]
	@Published var cash: [String] = [""]
	
	@Published var totalCbEmv: Double = 0
	@Published var totalCbLess: Double = 0
	@Published var totalAmex: Double = 0
	@Published var totalAmexLess: Double = 0
	@Published var totalCash: Double = 0
	
	@Published var total: Double = 0
	
	func saveTotal(type: TYPE_PAYEMENT) {
		switch type {
			case .CBEMV:
				totalCbEmv = formattedArrayDouble(arrayString: cb_emv)
			case .CBLESS:
				totalCbLess = formattedArrayDouble(arrayString: cb_less)
			case .AMEX:
				totalAmex = formattedArrayDouble(arrayString: amex)
			case .AMEXLESS:
				totalAmexLess = formattedArrayDouble(arrayString: amex_less)
			case .CASH:
				totalCash = formattedArrayDouble(arrayString: cash)
		}
	}
	
	func resultTotal() -> Double {
		return totalCbEmv + totalCbLess + totalAmex + totalAmexLess + totalCash
	}
	
	func diff() -> Double {
		return resultTotal() - (textFieldCashRegister ?? 0)
	}
	
	func formattedArrayDouble(arrayString: [String]) -> Double {
		var arrDouble: [Double] = []
		
		for i in arrayString.indices {
			arrDouble.append(Double(arrayString[i]) ?? 0)
		}
		
		return arrDouble.reduce(0, +)
	}
	
	func isPositiveDiff()  -> Bool {
		return diff() > 0
	}
}
