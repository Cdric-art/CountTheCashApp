	//
	//  CashFundView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashFundView: View {
	@ObservedObject var cashFund: CashFundViewModel
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
								.keyboardType(.decimalPad)
								.multilineTextAlignment(.center)
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
						
						HStack {
							TextField("0", value: $cashFund.bills.twenty, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.bills.twenty)  { _ in
									if cashFund.bills.twenty == 0 {
										cashFund.additionResults.twentyBill = 0
										cashFund.totalAddition()
									} else {
										cashFund.additionResults.twentyBill = Double(cashFund.bills.twenty ?? 0) * 20.0
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
							Text(cashFund.additionResults.twentyBill.formatted(.currency(code: "EUR")))
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
							TextField("0", value: $cashFund.bills.ten, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.bills.ten)  { _ in
									if cashFund.bills.ten == 0 {
										cashFund.additionResults.tenBill = 0
										cashFund.totalAddition()
									} else {
										cashFund.additionResults.tenBill = Double(cashFund.bills.ten ?? 0) * 10.0
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
							Text(cashFund.additionResults.tenBill.formatted(.currency(code: "EUR")))
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
							TextField("0", value: $cashFund.bills.five, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.bills.five)  { _ in
									if cashFund.bills.five == 0 {
										cashFund.additionResults.fiveBill = 0
										cashFund.totalAddition()
									} else {
										cashFund.additionResults.fiveBill = Double(cashFund.bills.five ?? 0) * 5.0
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
							Text(cashFund.additionResults.fiveBill.formatted(.currency(code: "EUR")))
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
							TextField("0", value: $cashFund.coins.two, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.coins.two)  { _ in
									if cashFund.coins.two == 0 {
										cashFund.additionResults.twoCoin = 0
										cashFund.totalAddition()
									} else {
										cashFund.additionResults.twoCoin = Double(cashFund.coins.two ?? 0) * 2.0
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
							Text(cashFund.additionResults.twoCoin.formatted(.currency(code: "EUR")))
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
							TextField("0", value: $cashFund.coins.one, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.coins.one)  { _ in
									if cashFund.coins.one == 0 {
										cashFund.additionResults.oneCoin = 0
										cashFund.totalAddition()
									} else {
										cashFund.additionResults.oneCoin = Double(cashFund.coins.one ?? 0) * 1.0
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
							Text(cashFund.additionResults.oneCoin.formatted(.currency(code: "EUR")))
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
							TextField("0", value: $cashFund.coins.fifty, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.coins.fifty)  { _ in
									if cashFund.coins.fifty == 0 {
										cashFund.additionResults.fiftyCentCoin = 0
										cashFund.totalAddition()
									} else {
										cashFund.additionResults.fiftyCentCoin = Double(cashFund.coins.fifty ?? 0) * 0.5
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
							Text(cashFund.additionResults.fiftyCentCoin.formatted(.currency(code: "EUR")))
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
							TextField("0", value: $cashFund.coins.twenty, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.coins.twenty)  { _ in
									if cashFund.coins.twenty == 0 {
										cashFund.additionResults.twentyCentCoin = 0
										cashFund.totalAddition()
									} else {
										cashFund.additionResults.twentyCentCoin = Double(cashFund.coins.twenty ?? 0) * 0.2
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
							Text(cashFund.additionResults.twentyCentCoin.formatted(.currency(code: "EUR")))
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
							TextField("0", value: $cashFund.coins.ten, format: .number)
								.focused($isInputActive)
								.onChange(of: cashFund.coins.ten)  { _ in
									if cashFund.coins.ten == 0 {
										cashFund.additionResults.tenCentCoin = 0
										cashFund.totalAddition()
									} else {
										cashFund.additionResults.tenCentCoin = Double(cashFund.coins.ten ?? 0) * 0.1
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
							Text(cashFund.additionResults.tenCentCoin.formatted(.currency(code: "EUR")))
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
		CashFundView(cashFund: CashFundViewModel())
	}
}
