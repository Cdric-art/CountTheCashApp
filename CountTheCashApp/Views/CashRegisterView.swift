	//
	//  CashRegisterView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashRegisterView: View {
	@ObservedObject var cashRegisterData: CashRegister
	
	var body: some View {
		VStack {
			VStack {
				Text("Caisse")
					.font(.title)
					.fontWeight(.heavy)
					.padding(.bottom, -10)
				HStack {
					VStack {
						Text("Flash :")
							.font(/*@START_MENU_TOKEN@*/.caption2/*@END_MENU_TOKEN@*/)
						
						TextField("Montant", value: $cashRegisterData.textFieldCashRegister, format: .number)
							.keyboardType(.numbersAndPunctuation)
							.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
					}
					.padding(.horizontal, 30)
					
					VStack {
						Text("Couverts :")
							.font(/*@START_MENU_TOKEN@*/.caption2/*@END_MENU_TOKEN@*/)
							
						TextField("Nombre", value: $cashRegisterData.textFieldCouverts, format: .number)
							.keyboardType(.numbersAndPunctuation)
							.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
					}
					.padding(.horizontal, 30)
				}
				.padding(.top, 18)
			}
			
			VStack(alignment: .leading) {
				List {
					CbEmvView(cashRegister: cashRegisterData)
					CbLessView(cashRegister: cashRegisterData)
					AmexView(cashRegister: cashRegisterData)
					AmexLessView(cashRegister: cashRegisterData)
					TicketRestaurantView(cashRegister: cashRegisterData)
					CashView(cashRegister: cashRegisterData)
				}
				.listStyle(.insetGrouped)
				.padding(.top, 16)
				
				HStack {
					VStack(spacing: 4) {
						HStack {
							Text("Total :")
							Text(cashRegisterData.resultTotal().formatted(.currency(code: "EUR")))
							Spacer()
						}
						.font(.headline)
						
						HStack {
							Text("Difference :")
								.font(.callout)
							Text(cashRegisterData.isPositiveDiff() ? "+\(cashRegisterData.diff().formatted(.currency(code: "EUR")))" : cashRegisterData.diff().formatted(.currency(code: "EUR")))
							Spacer()
						}
						.foregroundColor(cashRegisterData.isPositiveDiff() ? .green : .gray)
					}
					VStack(spacing: 4) {
						Text("Ticket Moyen")
						Text(cashRegisterData.ticketMoyen().formatted(.currency(code: "EUR")))
					}
					.font(.footnote)
				}
				.padding(.horizontal, 16)
				.padding(.top, 16)
			}
		}
	}
}

struct CashRegisterView_Previews: PreviewProvider {
	static var previews: some View {
		CashRegisterView(cashRegisterData: CashRegister())
	}
}

struct CbEmvView: View {
	@ObservedObject var cashRegister: CashRegister

	var body: some View {
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
				.foregroundColor(.teal)
		} footer: {
			Text("Total: \(cashRegister.totalCbEmv.formatted())")
		}
	}
}

struct CbLessView: View {
	@ObservedObject var cashRegister: CashRegister
	
	var body: some View {
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
				.foregroundColor(.purple)
		} footer: {
			Text("Total: \(cashRegister.totalCbLess.formatted())")
		}
	}
}

struct AmexView: View {
	@ObservedObject var cashRegister: CashRegister
	var body: some View {
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
				.foregroundColor(.brown)
		} footer: {
			Text("Total: \(cashRegister.totalAmex.formatted())")
		}
	}
}

struct AmexLessView: View {
	@ObservedObject var cashRegister: CashRegister
	var body: some View {
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
				.foregroundColor(.orange)
		} footer: {
			Text("Total: \(cashRegister.totalAmexLess.formatted())")
		}
	}
}

struct TicketRestaurantView: View {
	@ObservedObject var cashRegister: CashRegister
	var body: some View {
		Section {
			ForEach(cashRegister.ticketRestaurant.indices, id: \.self) { i in
				HStack {
					TextField("Montant", text: $cashRegister.ticketRestaurant[i])
						.keyboardType(.numbersAndPunctuation)
						.onChange(of: cashRegister.ticketRestaurant[i]) { value in
							cashRegister.ticketRestaurant[i] = value
							cashRegister.saveTotal(type: .TICKETRESTAURANT)
						}
					Button {
						if cashRegister.ticketRestaurant[0] != "" {
							cashRegister.ticketRestaurant.append("")
						}
					} label: {
						Image(systemName: "plus.circle.fill")
							.foregroundColor(.gray)
					}
				}
			}
		} header: {
			Text("Ticket Restaurant")
				.foregroundColor(.mint)
		} footer: {
			Text("Total: \(cashRegister.totalTicketRestaurant.formatted())")
		}
	}
}

struct CashView: View {
	@ObservedObject var cashRegister: CashRegister
	var body: some View {
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
			Text("CASH")
				.foregroundColor(.red)
		} footer: {
			Text("Total: \(cashRegister.totalCash.formatted())")
		}
	}
}
