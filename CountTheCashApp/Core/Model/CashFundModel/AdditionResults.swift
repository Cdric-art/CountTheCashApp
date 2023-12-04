//
//  AdditionResults.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 22/02/2023.
//

import Foundation

struct AdditionResults {
    var hundredBill: Double
    var fiftyBill: Double
    var twentyBill: Double
    var tenBill: Double
    var fiveBill: Double
    var twoCoin: Double
    var oneCoin: Double
    var fiftyCentCoin: Double
    var twentyCentCoin: Double
    var tenCentCoin: Double
    var fiveCentCoin: Double
    var twoCentCoin: Double
    var oneCentCoin: Double
	
    init(
        hundredBill: Double = 0,
        fiftyBill: Double = 0,
        twentyBill: Double = 0,
        tenBill: Double = 0,
        fiveBill: Double = 0,
        twoCoin: Double = 0,
        oneCoin: Double = 0,
        fiftyCentCoin: Double = 0,
        twentyCentCoin: Double = 0,
        tenCentCoin: Double = 0,
        fiveCentCoin: Double = 0,
        twoCentCoin: Double = 0,
        oneCentCoin: Double = 0
    ) {
        self.hundredBill = hundredBill
        self.fiftyBill = fiftyBill
        self.twentyBill = twentyBill
        self.tenBill = tenBill
        self.fiveBill = fiveBill
        self.twoCoin = twoCoin
        self.oneCoin = oneCoin
        self.fiftyCentCoin = fiftyCentCoin
        self.twentyCentCoin = twentyCentCoin
        self.tenCentCoin = tenCentCoin
        self.fiveCentCoin = fiveCentCoin
        self.twoCentCoin = twoCentCoin
        self.oneCentCoin = oneCentCoin
    }
}
