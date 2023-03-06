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
		ZStack {
			
			CircleBackground()
			
			VStack {
				VStack {
					TitleSecondaryView(title: "Caisse", color: .white)
					HStack {
						VStack {
							Text("Flash :")
								.foregroundColor(.white)
							TextField("Montant", value: $cashRegisterData.textFieldCashRegister, format: .number)
								.keyboardType(.decimalPad)
								.frame(maxWidth: 100, minHeight: 36)
								.background(RoundedRectangle(cornerRadius: 10).fill(.white).opacity(0.8))
								.focused($isInputActive)
								.toolbar {
									ToolbarItemGroup(placement: .keyboard) {
										Spacer()
										Button(action: {
											isInputActive.toggle()
										}) {
											Image(systemName: "chevron.down")
												.foregroundColor(Color("primaryColor"))
										}
									}
								}
						}
						.padding(.horizontal, 30)
						
						VStack {
							Text("Couverts :")
								.foregroundColor(.white)
							TextField("Nombre", value: $cashRegisterData.textFieldCouverts, format: .number)
								.keyboardType(.decimalPad)
								.frame(maxWidth: 100, minHeight: 36)
								.background(RoundedRectangle(cornerRadius: 10).fill(.white).opacity(0.8))
								.focused($isInputActive)
						}
						.padding(.horizontal, 30)
					}
					.padding(.top, 1)
					.multilineTextAlignment(.center)
				}
				.foregroundColor(.black)
				
				VStack {
					ScrollView {
						CbEmvView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
						CbLessView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
						AmexView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
						AmexLessView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
						TicketRestaurantView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
						CashView(cashRegister: cashRegisterData, isInputActive: $isInputActive)
					}
					.scrollContentBackground(.hidden)
					.scrollIndicators(.hidden)
					.background(RoundedRectangle(cornerRadius: 12).fill(.white).opacity(0.6))
					.padding(6)
					
					HStack {
						VStack(spacing: 4) {
							HStack {
								Text("Total :")
								Text(cashRegisterData.resultTotal().formatted(.currency(code: "EUR")))
								Spacer()
							}
							.font(.headline)
							.foregroundColor(.black).opacity(0.8)
							
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
						.foregroundColor(.black).opacity(0.8)
					}
					.frame(height: 60)
					.padding(.horizontal, 16)
				}
			}
		}
		.accentColor(.black)
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
				.foregroundColor(.teal)
			
			ForEach(cashRegister.cb_emv.indices, id: \.self) { i in
				HStack {
					TextField("Montant", text: $cashRegister.cb_emv[i])
						.keyboardType(.decimalPad)
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
								.foregroundColor(Color("primaryColor"))
								.opacity(0.8)
						}
					}
				}
				.padding(6)
				.background(.white.opacity(0.9))
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(Color.teal, lineWidth: 1)
				)
			}
			
			Text("Total: \(cashRegister.totalCbEmv.formatted(.currency(code: "EUR")))")
				.font(.caption2)
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
				.foregroundColor(.purple)
			
			ForEach(cashRegister.cb_less.indices, id: \.self) { i in
				HStack {
					TextField("Montant", text: $cashRegister.cb_less[i])
						.keyboardType(.decimalPad)
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
								.foregroundColor(Color("primaryColor"))
								.opacity(0.8)
						}
					}
				}
				.padding(6)
				.background(.white.opacity(0.9))
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(Color.purple, lineWidth: 1)
				)
			}
			
			Text("Total: \(cashRegister.totalCbLess.formatted(.currency(code: "EUR")))")
				.font(.caption2)
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
						.keyboardType(.decimalPad)
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
								.foregroundColor(Color("primaryColor"))
								.opacity(0.8)
						}
					}
				}
				.padding(6)
				.background(.white.opacity(0.9))
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(.brown, lineWidth: 1)
				)
			}
			
			Text("Total: \(cashRegister.totalAmex.formatted(.currency(code: "EUR")))")
				.font(.caption2)
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
						.keyboardType(.decimalPad)
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
								.foregroundColor(Color("primaryColor"))
								.opacity(0.8)
						}
					}
				}
				.padding(6)
				.background(.white.opacity(0.9))
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(.orange, lineWidth: 1)
				)
			}
			
			Text("Total: \(cashRegister.totalAmexLess.formatted(.currency(code: "EUR")))")
				.font(.caption2)
			
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
						.keyboardType(.decimalPad)
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
								.foregroundColor(Color("primaryColor"))
								.opacity(0.8)
						}
					}
				}
				.padding(6)
				.background(.white.opacity(0.9))
				.cornerRadius(10)
				.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(.mint, lineWidth: 1)
				)
			}
			
			Text("Total: \(cashRegister.totalTicketRestaurant.formatted(.currency(code: "EUR")))")
				.font(.caption2)
			
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
					.keyboardType(.decimalPad)
					.onChange(of: cashRegister.cash[0]) { value in
						cashRegister.cash[0] = value.replacingOccurrences(of: ",", with: ".")
						cashRegister.saveTotal(type: .CASH)
					}
					.focused(isInputActive)
					.padding(6)
					.background(.white.opacity(0.9))
					.cornerRadius(10)
					.overlay(
						RoundedRectangle(cornerRadius: 10)
							.stroke(.red, lineWidth: 1)
					)
			}
			
			Text("Total: \(cashRegister.totalCash.formatted(.currency(code: "EUR")))")
				.font(.caption2)
			
		}
		.padding(.horizontal)
		.padding(.top, 4)
		.padding(.bottom, 12)
	}
}
