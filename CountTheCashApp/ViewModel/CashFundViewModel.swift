//
//  CashFundModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 15/01/2023.
//

import Foundation

class CashFundViewModel: ObservableObject {
	
	@Published var textFieldCashFund: Double?
	
	@Published var coins = Coins()
	@Published var bills = Bills()
	
	@Published var additionResults = AdditionResults()
	
	@Published var total: Double = 0
	@Published var difference: Double = 0
	
	func totalAddition() {
        total = additionResults.twentyBill + additionResults.tenBill + additionResults.fiveBill + additionResults.twoCoin + additionResults.oneCoin + additionResults.fiftyCentCoin + additionResults.twentyCentCoin + additionResults.tenCentCoin + additionResults.fiveCentCoin + additionResults.twoCentCoin + additionResults.oneCentCoin
	}
	
    var differenceCalcul: String {
        let result = total - (textFieldCashFund ?? 0)
        return result.formatted(.currency(code: "EUR"))
    }
	
}
