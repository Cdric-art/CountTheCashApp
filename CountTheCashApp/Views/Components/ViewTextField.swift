//
//  ViewTextField.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 27/03/2023.
//

import SwiftUI

struct ViewTextField: View {
	@ObservedObject var cashFund: CashFundViewModel
	@FocusState private var isInputActive: Bool
	
    var body: some View {
		HStack {
			TextField("0", value: $cashFund.bills.fifty, format: .number)
				.focused($isInputActive)
				.onChange(of: cashFund.bills.fifty)  { _ in
					if cashFund.bills.fifty == 0 {
						cashFund.additionResults.fiftyBill = 0
						cashFund.totalAddition()
					} else {
						cashFund.additionResults.fiftyBill = Double(cashFund.bills.fifty ?? 0) * 50.0
						cashFund.totalAddition()
					}
				}
				.frame(maxWidth: 50)
			Text("x")
			Text("50")
			Spacer()
			Text("=")
			Text(cashFund.additionResults.fiftyBill.formatted(.currency(code: "EUR")))
				.frame(width: 100, alignment: .trailing)
		}
		.padding(.horizontal, 16)
		.padding(.vertical, 12)
		.background(.white.opacity(0.9))
		.cornerRadius(10)
		.overlay(
			RoundedRectangle(cornerRadius: 10)
				.stroke(Color.gray, lineWidth: 1)
		)
    }
}

struct ViewTextField_Previews: PreviewProvider {
    static var previews: some View {
		ViewTextField(cashFund: CashFundViewModel())
    }
}
