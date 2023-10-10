//
//  CashFund.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 15/01/2023.
//

import Foundation
import Observation

@Observable
class CashFund {
	
	var textFieldCashFund: Double?
	
	var coins = Coins()
	var bills = Bills()
	
	var additionResults = AdditionResults()
	
	var total: Double = 0
	var difference: Double = 0
	
	func totalAddition() {
        total = additionResults.twentyBill + additionResults.tenBill + additionResults.fiveBill + additionResults.twoCoin + additionResults.oneCoin + additionResults.fiftyCentCoin + additionResults.twentyCentCoin + additionResults.tenCentCoin + additionResults.fiveCentCoin + additionResults.twoCentCoin + additionResults.oneCentCoin
	}
	
    var differenceCalcul: String {
        let result = total - (textFieldCashFund ?? 0)
        return result.formatted(.currency(code: "EUR"))
    }
    
    var isPositiveDiff: Bool {
        let result = total - (textFieldCashFund ?? 0)
        return result > 0
    }
	
}
