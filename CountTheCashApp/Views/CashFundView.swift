	//
	//  CashFundView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashFundView: View {
	
	@ObservedObject var cashFund: CashFund

	private func totalAddition() {
		cashFund.total = cashFund.resultFiftyBill + cashFund.resultTwentyBill + cashFund.resultTenBill + cashFund.resultFiveBill + cashFund.resultTwoCoin + cashFund.resultOneCoin + cashFund.resultFiftyCentCoin + cashFund.resultTwentyCentCoin + cashFund.resultTenCentCoin
	}
	private func differenceCalcul() -> Double {
		if cashFund.textFieldCashFund != nil {
			return cashFund.total - cashFund.textFieldCashFund!
		}
		return 0
	}
	
	var body: some View {
		VStack {
			VStack {
				Text("Cash Fund")
					.font(.largeTitle)
					.padding(.bottom, -10)
				TextField("Amount", value: $cashFund.textFieldCashFund, format: .number)
					.keyboardType(.numberPad)
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
								totalAddition()
							} else {
								cashFund.resultFiftyBill = Double(cashFund.fiftyBill) * 50.0
								totalAddition()
							}
						}
						.keyboardType(.numberPad)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("50")
					Spacer()
					Text("=")
					Spacer()
					Text(cashFund.resultFiftyBill.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.twentyBill, format: .number)
						.onChange(of: cashFund.twentyBill)  { _ in
							if cashFund.twentyBill == 0 {
								cashFund.resultTwentyBill = 0
								totalAddition()
							} else {
								cashFund.resultTwentyBill = Double(cashFund.twentyBill) * 20.0
								totalAddition()
							}
						}
						.keyboardType(.numberPad)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("20")
					Spacer()
					Text("=")
					Spacer()
					Text(cashFund.resultTwentyBill.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.tenBill, format: .number)
						.onChange(of: cashFund.tenBill)  { _ in
							if cashFund.tenBill == 0 {
								cashFund.resultTenBill = 0
								totalAddition()
							} else {
								cashFund.resultTenBill = Double(cashFund.tenBill) * 10.0
								totalAddition()
							}
						}
						.keyboardType(.numberPad)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("10")
					Spacer()
					Text("=")
					Spacer()
					Text(cashFund.resultTenBill.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.fiveBill, format: .number)
						.onChange(of: cashFund.fiveBill)  { _ in
							if cashFund.fiveBill == 0 {
								cashFund.resultFiveBill = 0
								totalAddition()
							} else {
								cashFund.resultFiveBill = Double(cashFund.fiveBill) * 5.0
								totalAddition()
							}
						}
						.keyboardType(.numberPad)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text(" 5")
					Spacer()
					Text("=")
					Spacer()
					Text(cashFund.resultFiveBill.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.twoCoin, format: .number)
						.onChange(of: cashFund.twoCoin)  { _ in
							if cashFund.twoCoin == 0 {
								cashFund.resultTwoCoin = 0
								totalAddition()
							} else {
								cashFund.resultTwoCoin = Double(cashFund.twoCoin) * 2.0
								totalAddition()
							}
						}
						.keyboardType(.numberPad)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text(" 2")
					Spacer()
					Text("=")
					Spacer()
					Text(cashFund.resultTwoCoin.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.oneCoin, format: .number)
						.onChange(of: cashFund.oneCoin)  { _ in
							if cashFund.oneCoin == 0 {
								cashFund.resultOneCoin = 0
								totalAddition()
							} else {
								cashFund.resultOneCoin = Double(cashFund.oneCoin) * 1.0
								totalAddition()
							}
						}
						.keyboardType(.numberPad)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text(" 1")
					Spacer()
					Text("=")
					Spacer()
					Text(cashFund.resultOneCoin.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.fiftyCentCoin, format: .number)
						.onChange(of: cashFund.fiftyCentCoin)  { _ in
							if cashFund.fiftyCentCoin == 0 {
								cashFund.resultFiftyCentCoin = 0
								totalAddition()
							} else {
								cashFund.resultFiftyCentCoin = Double(cashFund.fiftyCentCoin) * 0.5
								totalAddition()
							}
						}
						.keyboardType(.numberPad)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("0.50")
						.padding(.trailing, 30)
					Text("=")
					Spacer()
					Text(cashFund.resultFiftyCentCoin.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.twentyCentCoin, format: .number)
						.onChange(of: cashFund.twentyCentCoin)  { _ in
							if cashFund.twentyCentCoin == 0 {
								cashFund.resultTwentyCentCoin = 0
								totalAddition()
							} else {
								cashFund.resultTwentyCentCoin = Double(cashFund.twentyCentCoin) * 0.2
								totalAddition()
							}
						}
						.keyboardType(.numberPad)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("0.20")
						.padding(.trailing, 30)
					Text("=")
					Spacer()
					Text(cashFund.resultTwentyCentCoin.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $cashFund.tenCentCoin, format: .number)
						.onChange(of: cashFund.tenCentCoin)  { _ in
							if cashFund.tenCentCoin == 0 {
								cashFund.resultTenCentCoin = 0
								totalAddition()
							} else {
								cashFund.resultTenCentCoin = Double(cashFund.tenCentCoin) * 0.1
								totalAddition()
							}
						}
						.keyboardType(.numberPad)
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("0.10")
						.padding(.trailing, 30)
					Text("=")
					Spacer()
					Text(cashFund.resultTenCentCoin.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
			}
			
			Spacer()
			
			VStack(spacing: 4) {
				HStack {
					Text("Total :")
					Text(cashFund.total.formatted())
					Spacer()
				}
				.font(.headline)
				
				HStack {
					Text("Difference :")
						.font(.callout)
					Text(differenceCalcul().formatted())
					Spacer()
				}
			}
		}
		.scrollContentBackground(.hidden)
		.padding()
	}
}

struct CashFundView_Previews: PreviewProvider {
	static var previews: some View {
		CashFundView(cashFund: CashFund())
	}
}
