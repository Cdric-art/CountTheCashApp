	//
	//  CashFundView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashFundView: View {
	@ObservedObject var cashFund: CashFund
	
	var body: some View {
		VStack {
			VStack {
				Text("Fond de caisse")
					.font(.title)
					.fontWeight(.heavy)
					.padding(.bottom, -10)
				TextField("Montant", value: $cashFund.textFieldCashFund, format: .number)
					.keyboardType(.numbersAndPunctuation)
					.textFieldStyle(.roundedBorder)
					.multilineTextAlignment(.center)
					.frame(maxWidth: 100)
					.padding()
			}
			
			List {
				HStack {
					TextField("0", value: $cashFund.fiftyBill, format: .number)
						.onChange(of: cashFund.fiftyBill)  { _ in
							if cashFund.fiftyBill == 0 {
								cashFund.resultFiftyBill = 0
								cashFund.totalAddition()
							} else {
								cashFund.resultFiftyBill = Double(cashFund.fiftyBill) * 50.0
								cashFund.totalAddition()
							}
						}
						.keyboardType(.numbersAndPunctuation)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("50")
					Spacer()
					Text("=")
					Text(cashFund.resultFiftyBill.formatted(.currency(code: "EUR")))
						.frame(width: 100, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.twentyBill, format: .number)
						.onChange(of: cashFund.twentyBill)  { _ in
							if cashFund.twentyBill == 0 {
								cashFund.resultTwentyBill = 0
								cashFund.totalAddition()
							} else {
								cashFund.resultTwentyBill = Double(cashFund.twentyBill) * 20.0
								cashFund.totalAddition()
							}
						}
						.keyboardType(.numbersAndPunctuation)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("20")
					Spacer()
					Text("=")
					Text(cashFund.resultTwentyBill.formatted(.currency(code: "EUR")))
						.frame(width: 100, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.tenBill, format: .number)
						.onChange(of: cashFund.tenBill)  { _ in
							if cashFund.tenBill == 0 {
								cashFund.resultTenBill = 0
								cashFund.totalAddition()
							} else {
								cashFund.resultTenBill = Double(cashFund.tenBill) * 10.0
								cashFund.totalAddition()
							}
						}
						.keyboardType(.numbersAndPunctuation)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("10")
					Spacer()
					Text("=")
					Text(cashFund.resultTenBill.formatted(.currency(code: "EUR")))
						.frame(width: 100, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.fiveBill, format: .number)
						.onChange(of: cashFund.fiveBill)  { _ in
							if cashFund.fiveBill == 0 {
								cashFund.resultFiveBill = 0
								cashFund.totalAddition()
							} else {
								cashFund.resultFiveBill = Double(cashFund.fiveBill) * 5.0
								cashFund.totalAddition()
							}
						}
						.keyboardType(.numbersAndPunctuation)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text(" 5")
					Spacer()
					Text("=")
					Text(cashFund.resultFiveBill.formatted(.currency(code: "EUR")))
						.frame(width: 100, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.twoCoin, format: .number)
						.onChange(of: cashFund.twoCoin)  { _ in
							if cashFund.twoCoin == 0 {
								cashFund.resultTwoCoin = 0
								cashFund.totalAddition()
							} else {
								cashFund.resultTwoCoin = Double(cashFund.twoCoin) * 2.0
								cashFund.totalAddition()
							}
						}
						.keyboardType(.numbersAndPunctuation)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text(" 2")
					Spacer()
					Text("=")
					Text(cashFund.resultTwoCoin.formatted(.currency(code: "EUR")))
						.frame(width: 100, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.oneCoin, format: .number)
						.onChange(of: cashFund.oneCoin)  { _ in
							if cashFund.oneCoin == 0 {
								cashFund.resultOneCoin = 0
								cashFund.totalAddition()
							} else {
								cashFund.resultOneCoin = Double(cashFund.oneCoin) * 1.0
								cashFund.totalAddition()
							}
						}
						.keyboardType(.numbersAndPunctuation)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text(" 1")
					Spacer()
					Text("=")
					Text(cashFund.resultOneCoin.formatted(.currency(code: "EUR")))
						.frame(width: 100, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.fiftyCentCoin, format: .number)
						.onChange(of: cashFund.fiftyCentCoin)  { _ in
							if cashFund.fiftyCentCoin == 0 {
								cashFund.resultFiftyCentCoin = 0
								cashFund.totalAddition()
							} else {
								cashFund.resultFiftyCentCoin = Double(cashFund.fiftyCentCoin) * 0.5
								cashFund.totalAddition()
							}
						}
						.keyboardType(.numbersAndPunctuation)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("0.50")
					Spacer()
					Text("=")
					Text(cashFund.resultFiftyCentCoin.formatted(.currency(code: "EUR")))
						.frame(width: 100, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.twentyCentCoin, format: .number)
						.onChange(of: cashFund.twentyCentCoin)  { _ in
							if cashFund.twentyCentCoin == 0 {
								cashFund.resultTwentyCentCoin = 0
								cashFund.totalAddition()
							} else {
								cashFund.resultTwentyCentCoin = Double(cashFund.twentyCentCoin) * 0.2
								cashFund.totalAddition()
							}
						}
						.keyboardType(.numbersAndPunctuation)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("0.20")
					Spacer()
					Text("=")
					Text(cashFund.resultTwentyCentCoin.formatted(.currency(code: "EUR")))
						.frame(width: 100, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.tenCentCoin, format: .number)
						.onChange(of: cashFund.tenCentCoin)  { _ in
							if cashFund.tenCentCoin == 0 {
								cashFund.resultTenCentCoin = 0
								cashFund.totalAddition()
							} else {
								cashFund.resultTenCentCoin = Double(cashFund.tenCentCoin) * 0.1
								cashFund.totalAddition()
							}
						}
						.keyboardType(.numbersAndPunctuation)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("0.10")
					Spacer()
					Text("=")
					Text(cashFund.resultTenCentCoin.formatted(.currency(code: "EUR")))
						.frame(width: 100, alignment: .trailing)
				}
				.padding(2)
			}
			
			VStack(spacing: 4) {
				HStack {
					Text("Total :")
					Text(cashFund.total.formatted(.currency(code: "EUR")))
					Spacer()
				}
				.font(.headline)
				
				HStack {
					Text("Difference :")
						.font(.callout)
					Text(cashFund.differenceCalcul().formatted(.currency(code: "EUR")))
					Spacer()
				}
			}
			.frame(minHeight: 50)
			.padding()
		}
	}
}

struct CashFundView_Previews: PreviewProvider {
	static var previews: some View {
		CashFundView(cashFund: CashFund())
	}
}
