//
//  CashFundModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 15/01/2023.
//

import Foundation

class CashFund: ObservableObject {
	
	@Published var textFieldCashFund: Int?
	
	@Published var fiftyBill: Int?
	@Published var twentyBill: Int?
	@Published var tenBill: Int?
	@Published var fiveBill: Int?
	@Published var twoCoin: Int?
	@Published var oneCoin: Int?
	@Published var fiftyCentCoin: Int?
	@Published var twentyCentCoin: Int?
	@Published var tenCentCoin: Int?
	
	@Published var resultFiftyBill: Double = 0
	@Published var resultTwentyBill: Double = 0
	@Published var resultTenBill: Double = 0
	@Published var resultFiveBill: Double = 0
	@Published var resultTwoCoin: Double = 0
	@Published var resultOneCoin: Double = 0
	@Published var resultFiftyCentCoin: Double = 0
	@Published var resultTwentyCentCoin: Double = 0
	@Published var resultTenCentCoin: Double = 0
	
	@Published var total: Double = 0
	@Published var difference: Double = 0
	
	func totalAddition() {
		total = resultFiftyBill + resultTwentyBill + resultTenBill + resultFiveBill + resultTwoCoin + resultOneCoin + resultFiftyCentCoin + resultTwentyCentCoin + resultTenCentCoin
	}
	func differenceCalcul() -> Double {
		if textFieldCashFund != nil {
			return total - (Double(textFieldCashFund ?? 0))
		}
		return 0
	}
	
}
