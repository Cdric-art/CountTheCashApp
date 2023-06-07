//
//  CashFundModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 15/01/2023.
//

import Foundation

class CashFundViewModel: ObservableObject {
	
	@Published var textFieldCashFund: Int?
	
	@Published var coins = Coins()
	@Published var bills = Bills()
	
	@Published var additionResults = AdditionResults()
	
	@Published var total: Double = 0
	@Published var difference: Double = 0
	
	func totalAddition() {
		total = additionResults.fiftyBill + additionResults.twentyBill + additionResults.tenBill + additionResults.fiveBill + additionResults.twoCoin + additionResults.oneCoin + additionResults.fiftyCentCoin + additionResults.twentyCentCoin + additionResults.tenCentCoin
	}
	
	func differenceCalcul() -> Double {
		if textFieldCashFund != nil {
			return total - (Double(textFieldCashFund ?? 0))
		}
		return 0
	}
	
}
