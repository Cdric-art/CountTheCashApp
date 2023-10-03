//
//  AdditionResults.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 22/02/2023.
//

import Foundation

struct AdditionResults {
	var twentyBill: Double
	var tenBill: Double
	var fiveBill: Double
	var twoCoin: Double
	var oneCoin: Double
	var fiftyCentCoin: Double
	var twentyCentCoin: Double
	var tenCentCoin: Double
	
    init(
        twentyBill: Double = 0,
        tenBill: Double = 0,
        fiveBill: Double = 0,
        twoCoin: Double = 0,
        oneCoin: Double = 0,
        fiftyCentCoin: Double = 0,
        twentyCentCoin: Double = 0,
        tenCentCoin: Double = 0
    ) {
        self.twentyBill = twentyBill
        self.tenBill = tenBill
        self.fiveBill = fiveBill
        self.twoCoin = twoCoin
        self.oneCoin = oneCoin
        self.fiftyCentCoin = fiftyCentCoin
        self.twentyCentCoin = twentyCentCoin
        self.tenCentCoin = tenCentCoin
    }
}
