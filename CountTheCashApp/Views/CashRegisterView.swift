	//
	//  CashRegisterView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashRegisterView: View {
	@Environment(\.colorScheme) var colorScheme
	
	@ObservedObject var cashRegister: CashRegister
	
	var body: some View {
		VStack {
			VStack {
				Text("Caisse")
					.font(.title)
					.fontWeight(.heavy)
					.padding(.bottom, -10)
				TextField("Montant", value: $cashRegister.textFieldCashRegister, format: .number)
					.keyboardType(.numbersAndPunctuation)
					.textFieldStyle(.roundedBorder)
					.multilineTextAlignment(.center)
					.frame(maxWidth: 100)
					.padding()
			}
			
			VStack(alignment: .leading) {
				List {
					Section {
						ForEach(cashRegister.cb_emv.indices, id: \.self) { i in
							HStack {
								TextField("Montant", text: $cashRegister.cb_emv[i])
									.keyboardType(.numbersAndPunctuation)
									.onChange(of: cashRegister.cb_emv[i]) { value in
										cashRegister.cb_emv[i] = value
										cashRegister.saveTotal(type: .CBEMV)
									}
								Button {
									if cashRegister.cb_emv[0] != "" {
										cashRegister.cb_emv.append("")
									}
								} label: {
									Image(systemName: "plus.circle.fill")
										.foregroundColor(.gray)
								}
								
							}
						}
					} header: {
						Text("CB EMV")
					} footer: {
						Text("Total: \(cashRegister.totalCbEmv.formatted())")
					}
					Section {
						ForEach(cashRegister.cb_less.indices, id: \.self) { i in
							HStack {
								TextField("Montant", text: $cashRegister.cb_less[i])
									.keyboardType(.numbersAndPunctuation)
									.onChange(of: cashRegister.cb_less[i]) { value in
										cashRegister.cb_less[i] = value
										cashRegister.saveTotal(type: .CBLESS)
									}
								Button {
									if cashRegister.cb_less[0] != "" {
										cashRegister.cb_less.append("")
									}
								} label: {
									Image(systemName: "plus.circle.fill")
										.foregroundColor(.gray)
								}
								
							}
						}
					} header: {
						Text("CB LESS")
					} footer: {
						Text("Total: \(cashRegister.totalCbLess.formatted())")
					}
					Section {
						ForEach(cashRegister.amex.indices, id: \.self) { i in
							HStack {
								TextField("Montant", text: $cashRegister.amex[i])
									.keyboardType(.numbersAndPunctuation)
									.onChange(of: cashRegister.amex[i]) { value in
										cashRegister.amex[i] = value
										cashRegister.saveTotal(type: .AMEX)
									}
								Button {
									if cashRegister.amex[0] != "" {
										cashRegister.amex.append("")
									}
								} label: {
									Image(systemName: "plus.circle.fill")
										.foregroundColor(.gray)
								}
								
							}
						}
					} header: {
						Text("AMEX")
					} footer: {
						Text("Total: \(cashRegister.totalAmex.formatted())")
					}
					Section {
						ForEach(cashRegister.amex_less.indices, id: \.self) { i in
							HStack {
								TextField("Montant", text: $cashRegister.amex_less[i])
									.keyboardType(.numbersAndPunctuation)
									.onChange(of: cashRegister.amex_less[i]) { value in
										cashRegister.amex_less[i] = value
										cashRegister.saveTotal(type: .AMEXLESS)
									}
								Button {
									if cashRegister.amex_less[0] != "" {
										cashRegister.amex_less.append("")
									}
								} label: {
									Image(systemName: "plus.circle.fill")
										.foregroundColor(.gray)
								}
				
							}
						}
					} header: {
						Text("AMEX LESS")
					} footer: {
						Text("Total: \(cashRegister.totalAmexLess.formatted())")
					}
					Section {
						HStack {
							TextField("Montant", text: $cashRegister.cash[0])
								.keyboardType(.numbersAndPunctuation)
								.onChange(of: cashRegister.cash[0]) { value in
									cashRegister.cash[0] = value
									cashRegister.saveTotal(type: .CASH)
								}
						}
					} header: {
						Text("Cash")
					} footer: {
						Text("Total: \(cashRegister.totalCash.formatted())")
					}
				}
				.listStyle(.insetGrouped)
				.padding(.top, 16)
				
				Divider()
					.background(colorScheme == .dark ? .white : .black)
				
				VStack(spacing: 4) {
					HStack {
						Text("Total :")
						Text(cashRegister.resultTotal().formatted())
						Spacer()
					}
					.font(.headline)
					
					HStack {
						Text("Difference :")
							.font(.callout)
						Text(cashRegister.isPositiveDiff() ? "+\(cashRegister.diff().formatted())" : cashRegister.diff().formatted())
						Spacer()
					}
					.foregroundColor(cashRegister.isPositiveDiff() ? .green : .gray)
				}
				.frame(minHeight: 50)
				.padding()
			}
		}
	}
}

struct CashRegisterView_Previews: PreviewProvider {
	static var previews: some View {
		CashRegisterView(cashRegister: CashRegister())
	}
}
