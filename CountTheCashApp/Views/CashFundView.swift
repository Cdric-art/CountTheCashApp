	//
	//  CashFundView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashFundView: View {
	@ObservedObject var cashFund: CashFund
	@FocusState var isInputActive: Bool
	
	var body: some View {
		ZStack {
			
			CircleBackground()
			
			VStack {
				VStack {
					TitleSecondaryView(title: "Fond de caisse", color: .white)
					TextField("Montant", value: $cashFund.textFieldCashFund, format: .number)
						.keyboardType(.decimalPad)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 100, minHeight: 36)
						.background(RoundedRectangle(cornerRadius: 10).fill(.white).opacity(0.8))
						.focused($isInputActive)
						.toolbar {
							ToolbarItemGroup(placement: .keyboard) {
								Spacer()
								Button(action: {
									isInputActive = !isInputActive
								}) {
									Image(systemName: "chevron.down")
										.foregroundColor(Color("primaryColor"))
								}
							}
						}
				}
				
				ScrollView {
					VStack(spacing: 16) {
						HStack {
							TextField("0", value: $cashFund.fiftyBill, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.fiftyBill)  { _ in
									if cashFund.fiftyBill == 0 {
										cashFund.resultFiftyBill = 0
										cashFund.totalAddition()
									} else {
										cashFund.resultFiftyBill = Double(cashFund.fiftyBill ?? 0) * 50.0
										cashFund.totalAddition()
									}
								}
								.keyboardType(.decimalPad)
								.multilineTextAlignment(.center)
								.frame(maxWidth: 50)
							Text("x")
							Text("50")
							Spacer()
							Text("=")
							Text(cashFund.resultFiftyBill.formatted(.currency(code: "EUR")))
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
						
						HStack {
							TextField("0", value: $cashFund.twentyBill, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.twentyBill)  { _ in
									if cashFund.twentyBill == 0 {
										cashFund.resultTwentyBill = 0
										cashFund.totalAddition()
									} else {
										cashFund.resultTwentyBill = Double(cashFund.twentyBill ?? 0) * 20.0
										cashFund.totalAddition()
									}
								}
								.keyboardType(.decimalPad)
								.multilineTextAlignment(.center)
								.frame(maxWidth: 50)
							Text("x")
							Text("20")
							Spacer()
							Text("=")
							Text(cashFund.resultTwentyBill.formatted(.currency(code: "EUR")))
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
						
						HStack {
							TextField("0", value: $cashFund.tenBill, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.tenBill)  { _ in
									if cashFund.tenBill == 0 {
										cashFund.resultTenBill = 0
										cashFund.totalAddition()
									} else {
										cashFund.resultTenBill = Double(cashFund.tenBill ?? 0) * 10.0
										cashFund.totalAddition()
									}
								}
								.keyboardType(.decimalPad)
								.multilineTextAlignment(.center)
								.frame(maxWidth: 50)
							Text("x")
							Text("10")
							Spacer()
							Text("=")
							Text(cashFund.resultTenBill.formatted(.currency(code: "EUR")))
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
						
						HStack {
							TextField("0", value: $cashFund.fiveBill, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.fiveBill)  { _ in
									if cashFund.fiveBill == 0 {
										cashFund.resultFiveBill = 0
										cashFund.totalAddition()
									} else {
										cashFund.resultFiveBill = Double(cashFund.fiveBill ?? 0) * 5.0
										cashFund.totalAddition()
									}
								}
								.keyboardType(.decimalPad)
								.multilineTextAlignment(.center)
								.frame(maxWidth: 50)
							Text("x")
							Text(" 5")
							Spacer()
							Text("=")
							Text(cashFund.resultFiveBill.formatted(.currency(code: "EUR")))
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
						
						HStack {
							TextField("0", value: $cashFund.twoCoin, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.twoCoin)  { _ in
									if cashFund.twoCoin == 0 {
										cashFund.resultTwoCoin = 0
										cashFund.totalAddition()
									} else {
										cashFund.resultTwoCoin = Double(cashFund.twoCoin ?? 0) * 2.0
										cashFund.totalAddition()
									}
								}
								.keyboardType(.decimalPad)
								.multilineTextAlignment(.center)
								.frame(maxWidth: 50)
							Text("x")
							Text(" 2")
							Spacer()
							Text("=")
							Text(cashFund.resultTwoCoin.formatted(.currency(code: "EUR")))
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
						
						HStack {
							TextField("0", value: $cashFund.oneCoin, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.oneCoin)  { _ in
									if cashFund.oneCoin == 0 {
										cashFund.resultOneCoin = 0
										cashFund.totalAddition()
									} else {
										cashFund.resultOneCoin = Double(cashFund.oneCoin ?? 0) * 1.0
										cashFund.totalAddition()
									}
								}
								.keyboardType(.decimalPad)
								.multilineTextAlignment(.center)
								.frame(maxWidth: 50)
							Text("x")
							Text(" 1")
							Spacer()
							Text("=")
							Text(cashFund.resultOneCoin.formatted(.currency(code: "EUR")))
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
						
						HStack {
							TextField("0", value: $cashFund.fiftyCentCoin, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.fiftyCentCoin)  { _ in
									if cashFund.fiftyCentCoin == 0 {
										cashFund.resultFiftyCentCoin = 0
										cashFund.totalAddition()
									} else {
										cashFund.resultFiftyCentCoin = Double(cashFund.fiftyCentCoin ?? 0) * 0.5
										cashFund.totalAddition()
									}
								}
								.keyboardType(.decimalPad)
								.multilineTextAlignment(.center)
								.frame(maxWidth: 50)
							Text("x")
							Text("0.50")
							Spacer()
							Text("=")
							Text(cashFund.resultFiftyCentCoin.formatted(.currency(code: "EUR")))
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
						
						HStack {
							TextField("0", value: $cashFund.twentyCentCoin, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.twentyCentCoin)  { _ in
									if cashFund.twentyCentCoin == 0 {
										cashFund.resultTwentyCentCoin = 0
										cashFund.totalAddition()
									} else {
										cashFund.resultTwentyCentCoin = Double(cashFund.twentyCentCoin ?? 0) * 0.2
										cashFund.totalAddition()
									}
								}
								.keyboardType(.decimalPad)
								.multilineTextAlignment(.center)
								.frame(maxWidth: 50)
							Text("x")
							Text("0.20")
							Spacer()
							Text("=")
							Text(cashFund.resultTwentyCentCoin.formatted(.currency(code: "EUR")))
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
						
						HStack {
							TextField("0", value: $cashFund.tenCentCoin, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.tenCentCoin)  { _ in
									if cashFund.tenCentCoin == 0 {
										cashFund.resultTenCentCoin = 0
										cashFund.totalAddition()
									} else {
										cashFund.resultTenCentCoin = Double(cashFund.tenCentCoin ?? 0) * 0.1
										cashFund.totalAddition()
									}
								}
								.keyboardType(.decimalPad)
								.multilineTextAlignment(.center)
								.frame(maxWidth: 50)
							Text("x")
							Text("0.10")
							Spacer()
							Text("=")
							Text(cashFund.resultTenCentCoin.formatted(.currency(code: "EUR")))
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
					.padding()
				}
				.scrollContentBackground(.hidden)
				.scrollIndicators(.hidden)
				.background(RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.6))
				.padding()
				
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
				.foregroundColor(.black).opacity(0.8)
				.frame(minHeight: 50)
				.padding()
			}
			
		}
		.accentColor(.black)
	}
}

struct CashFundView_Previews: PreviewProvider {
	static var previews: some View {
		CashFundView(cashFund: CashFund())
	}
}
