	//
	//  CashRegisterView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashRegisterView: View {
	@ObservedObject var cashRegisterData: CashRegisterViewModel
	
	var body: some View {
		VStack {
			
			TitleSecondaryView(title: "Caisse")
			
			VStack(spacing: 12) {
				HStack(spacing: 24) {
					TextField("Rapport", value: $cashRegisterData.firstRapport, format: .number)
						.frame(maxWidth: 100, minHeight: 36)
						.background(RoundedRectangle(cornerRadius: 10).fill(.white))
						.overlay(content: {
							RoundedRectangle(cornerRadius: 10)
								.stroke(Color.gray.opacity(0.5), lineWidth: 1)
						})
					TextField("Rapport", value: $cashRegisterData.secondRapport, format: .number)
						.frame(maxWidth: 100, minHeight: 36)
						.background(RoundedRectangle(cornerRadius: 10).fill(.white))
						.overlay(content: {
							RoundedRectangle(cornerRadius: 10)
								.stroke(Color.gray.opacity(0.5), lineWidth: 1)
						})
				}
				.multilineTextAlignment(.center)
				
				HStack {
					Text("CA total :")
					Text(cashRegisterData.totalRapport().formatted(.currency(code: "EUR")))
				}
				.font(.caption2)
			}
			
			Divider()
			
			ScrollView {
				CbEmvView(cashRegister: cashRegisterData)
				CbLessView(cashRegister: cashRegisterData)
				AmexView(cashRegister: cashRegisterData)
				AmexLessView(cashRegister: cashRegisterData)
				TicketRestaurantView(cashRegister: cashRegisterData)
				CashView(cashRegister: cashRegisterData)
			}
			.padding(.horizontal, 24)
			.padding(.top, 12)
			.scrollDismissesKeyboard(.interactively)
			
			Divider()
			
			FooterCashRegister(cashRegisterData: cashRegisterData)
			
		}
		.keyboardType(.decimalPad)

	}
}

struct CashRegisterView_Previews: PreviewProvider {
	static var previews: some View {
		CashRegisterView(cashRegisterData: CashRegisterViewModel())
	}
}

struct CbEmvView: View {
	@ObservedObject var cashRegister: CashRegisterViewModel
	
	var body: some View {
		VStack(alignment: .leading) {
			
			Text("CB EMV")
				.font(.caption)
				.foregroundColor(.purple)
			
			ForEach(cashRegister.cb_emv.indices, id: \.self) { i in
				HStack {
					TextField("Montant", text: $cashRegister.cb_emv[i])
						.onChange(of: cashRegister.cb_emv[i]) { value in
							cashRegister.cb_emv[i] = value.replacingOccurrences(of: ",", with: ".")
							cashRegister.saveTotal(type: .CBEMV)
						}
					if i == 0 {
						Button {
							if cashRegister.cb_emv[0] != "" {
								cashRegister.cb_emv.append("")
							}
						} label: {
							Image(systemName: "plus.circle.fill")
						}
					}
				}
				.padding(6)
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(Color.purple, lineWidth: 1)
				)
			}
			
			Text("Total: \(cashRegister.totalCbEmv.formatted(.currency(code: "EUR")))")
				.font(.caption2)
				.foregroundColor(Color.purple)
		}
		.padding(.horizontal)
		.padding(.top, 12)
		.padding(.bottom, 4)
	}
}

struct CbLessView: View {
	@ObservedObject var cashRegister: CashRegisterViewModel
	
	var body: some View {
		VStack(alignment: .leading) {
			
			Text("CB LESS")
				.font(.caption)
				.foregroundColor(.teal)
			
			ForEach(cashRegister.cb_less.indices, id: \.self) { i in
				HStack {
					TextField("Montant", text: $cashRegister.cb_less[i])
						.onChange(of: cashRegister.cb_less[i]) { value in
							cashRegister.cb_less[i] = value.replacingOccurrences(of: ",", with: ".")
							cashRegister.saveTotal(type: .CBLESS)
						}
					if i == 0 {
						Button {
							if cashRegister.cb_less[0] != "" {
								cashRegister.cb_less.append("")
							}
						} label: {
							Image(systemName: "plus.circle.fill")
						}
					}
				}
				.padding(6)
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(Color.teal, lineWidth: 1)
				)
			}
			
			Text("Total: \(cashRegister.totalCbLess.formatted(.currency(code: "EUR")))")
				.font(.caption2)
				.foregroundColor(Color.teal)
		}
		.padding(.horizontal)
		.padding(.vertical, 4)
	}
}

struct AmexView: View {
	@ObservedObject var cashRegister: CashRegisterViewModel
	
	var body: some View {
		VStack(alignment: .leading) {
			
			Text("AMEX")
				.font(.caption)
				.foregroundColor(.brown)
			
			ForEach(cashRegister.amex.indices, id: \.self) { i in
				HStack {
					TextField("Montant", text: $cashRegister.amex[i])
						.onChange(of: cashRegister.amex[i]) { value in
							cashRegister.amex[i] = value.replacingOccurrences(of: ",", with: ".")
							cashRegister.saveTotal(type: .AMEX)
						}
					if i == 0 {
						Button {
							if cashRegister.amex[0] != "" {
								cashRegister.amex.append("")
							}
						} label: {
							Image(systemName: "plus.circle.fill")
						}
					}
				}
				.padding(6)
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(.brown, lineWidth: 1)
				)
			}
			
			Text("Total: \(cashRegister.totalAmex.formatted(.currency(code: "EUR")))")
				.font(.caption2)
				.foregroundColor(Color.brown)
		}
		.padding(.horizontal)
		.padding(.vertical, 4)
	}
}

struct AmexLessView: View {
	@ObservedObject var cashRegister: CashRegisterViewModel
	
	var body: some View {
		VStack(alignment: .leading) {
			
			Text("AMEX LESS")
				.font(.caption)
				.foregroundColor(.orange)
			
			ForEach(cashRegister.amex_less.indices, id: \.self) { i in
				HStack {
					TextField("Montant", text: $cashRegister.amex_less[i])
						.onChange(of: cashRegister.amex_less[i]) { value in
							cashRegister.amex_less[i] = value.replacingOccurrences(of: ",", with: ".")
							cashRegister.saveTotal(type: .AMEXLESS)
						}
					if i == 0 {
						Button {
							if cashRegister.amex_less[0] != "" {
								cashRegister.amex_less.append("")
							}
						} label: {
							Image(systemName: "plus.circle.fill")
						}
					}
				}
				.padding(6)
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(.orange, lineWidth: 1)
				)
			}
			
			Text("Total: \(cashRegister.totalAmexLess.formatted(.currency(code: "EUR")))")
				.font(.caption2)
				.foregroundColor(Color.orange)
			
		}
		.padding(.horizontal)
		.padding(.vertical, 4)
	}
}

struct TicketRestaurantView: View {
	@ObservedObject var cashRegister: CashRegisterViewModel
	
	var body: some View {
		VStack(alignment: .leading) {
			
			Text("T. RESTAURANT")
				.foregroundColor(.mint)
				.font(.caption)
			
			ForEach(cashRegister.ticketRestaurant.indices, id: \.self) { i in
				HStack {
					TextField("Montant", text: $cashRegister.ticketRestaurant[i])
						.onChange(of: cashRegister.ticketRestaurant[i]) { value in
							cashRegister.ticketRestaurant[i] = value.replacingOccurrences(of: ",", with: ".")
							cashRegister.saveTotal(type: .TICKETRESTAURANT)
						}
					if i == 0 {
						Button {
							if cashRegister.ticketRestaurant[0] != "" {
								cashRegister.ticketRestaurant.append("")
							}
						} label: {
							Image(systemName: "plus.circle.fill")
						}
					}
				}
				.padding(6)
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(.mint, lineWidth: 1)
				)
			}
			
			Text("Total: \(cashRegister.totalTicketRestaurant.formatted(.currency(code: "EUR")))")
				.font(.caption2)
				.foregroundColor(Color.mint)
		}
		.padding(.horizontal)
		.padding(.vertical, 4)
	}
}

struct CashView: View {
	@ObservedObject var cashRegister: CashRegisterViewModel
	
	var body: some View {
		VStack(alignment: .leading) {
			
			Text("CASH")
				.font(.caption)
				.foregroundColor(.red)
			
			HStack {
				TextField("Montant", text: $cashRegister.cash[0])
					.onChange(of: cashRegister.cash[0]) { value in
						cashRegister.cash[0] = value.replacingOccurrences(of: ",", with: ".")
						cashRegister.saveTotal(type: .CASH)
					}
					.padding(6)
					.cornerRadius(10)
					.overlay(
						RoundedRectangle(cornerRadius: 10)
							.stroke(.red, lineWidth: 1)
					)
			}
			
			Text("Total: \(cashRegister.totalCash.formatted(.currency(code: "EUR")))")
				.font(.caption2)
				.foregroundColor(Color.red)
		}
		.padding(.horizontal)
		.padding(.top, 4)
		.padding(.bottom, 12)
	}
}
