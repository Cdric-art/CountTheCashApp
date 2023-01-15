//
//  CashFundModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 15/01/2023.
//

import Foundation

class CashFund: ObservableObject {
	
	@Published var textFieldCashFund: Double?
	
	@Published var fiftyBill: Int = 0
	@Published var twentyBill: Int = 0
	@Published var tenBill: Int = 0
	@Published var fiveBill: Int = 0
	@Published var twoCoin: Int = 0
	@Published var oneCoin: Int = 0
	@Published var fiftyCentCoin: Int = 0
	@Published var twentyCentCoin: Int = 0
	@Published var tenCentCoin: Int = 0
	
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
	
}
