	//
	//  CashRegisterView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashRegisterView: View {
	@ObservedObject var cashRegisterData: CashRegisterViewModel
	@FocusState private var isInputActive: Bool
	
	var body: some View {
		VStack {
			
			TitleSecondaryView(title: "Caisse")
			
			HStack {
				TextField("Rapport Z", value: $cashRegisterData.textFieldCashRegister, format: .number)
					.frame(maxWidth: 100, minHeight: 36)
					.background(RoundedRectangle(cornerRadius: 10).fill(.white))
					.focused($isInputActive)
					.overlay(content: {
						RoundedRectangle(cornerRadius: 10)
							.stroke(Color.gray, lineWidth: 1)
					})
					.toolbar {
						ToolbarItemGroup(placement: .keyboard) {
							Spacer()
							Button(action: {
								isInputActive.toggle()
							}) {
								Image(systemName: "chevron.down")
							}
						}
					}
			}
			.multilineTextAlignment(.center)
			
			Divider()
			
			ScrollView {
				CbEmvView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
				CbLessView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
				AmexView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
				AmexLessView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
				TicketRestaurantView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
				CashView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
			}
			.padding(.horizontal, 24)
			.padding(.top, 12)
			
			Divider()
			
			VStack {
				HStack {
					VStack(spacing: 2) {
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
						.foregroundColor(cashRegisterData.isPositiveDiff() ? .green : .black.opacity(0.6))
					}
				}
			}
			.padding(.horizontal, 16)
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
	var isInputActive: FocusState<Bool>.Binding
	
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
						.focused(isInputActive)
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
	var isInputActive: FocusState<Bool>.Binding
	
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
						.focused(isInputActive)
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
	var isInputActive: FocusState<Bool>.Binding
	
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
						.focused(isInputActive)
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
	var isInputActive: FocusState<Bool>.Binding
	
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
						.focused(isInputActive)
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
	var isInputActive: FocusState<Bool>.Binding
	
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
						.focused(isInputActive)
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
	var isInputActive: FocusState<Bool>.Binding
	
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
					.focused(isInputActive)
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
