//
//  CashRegisterModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 18/01/2023.
//

import Foundation

class CashRegister: ObservableObject {
	
	@Published var textFieldCashRegister: Double?
	
	@Published var cb_emv: [String] = [""]
	@Published var cb_less: [String] = [""]
	
	@Published var totalCb_emv: Double = 0
	@Published var totalCb_less: Double = 0
}
