	//
	//  CashRegisterView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashRegisterView: View {
	
	@ObservedObject var cashRegister: CashRegister
	
	func formattedArrayDouble(arrayString: [String]) -> Double {
		
		var arrDouble: [Double] = []
		
		for i in arrayString.indices {
			arrDouble.append(Double(arrayString[i]) ?? 0)
		}
		
		return arrDouble.reduce(0, +)
	}
	func saveTotalCB_EMV() {
		cashRegister.totalCb_emv = formattedArrayDouble(arrayString: cashRegister.cb_emv)
	}
	func saveTotalCB_LESS() {
		cashRegister.totalCb_less = formattedArrayDouble(arrayString: cashRegister.cb_less)
	}
	
	var body: some View {
		VStack {
			VStack {
				Text("Cash Register")
					.font(.largeTitle)
					.padding(.bottom, -10)
				TextField("Amount", value: $cashRegister.textFieldCashRegister, format: .number)
					.keyboardType(.numberPad)
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
								TextField("Amount", text: $cashRegister.cb_emv[i])
									.keyboardType(.numberPad)
									.onChange(of: cashRegister.cb_emv[i]) { value in
										cashRegister.cb_emv[i] = value
										saveTotalCB_EMV()
									}
								Button {
									cashRegister.cb_emv.append("")
								} label: {
									Image(systemName: "plus.circle.fill")
										.foregroundColor(.gray)
								}
								
							}
						}
					} header: {
						Text("CB EMV")
					} footer: {
						Text("Total: \(cashRegister.totalCb_emv.formatted())")
							.foregroundColor(.black)
					}
					Section {
						ForEach(cashRegister.cb_less.indices, id: \.self) { i in
							HStack {
								TextField("Amount", text: $cashRegister.cb_less[i])
									.keyboardType(.numberPad)
									.onChange(of: cashRegister.cb_less[i]) { value in
										cashRegister.cb_less[i] = value
										saveTotalCB_LESS()
									}
								Button {
									cashRegister.cb_less.append("")
								} label: {
									Image(systemName: "plus.circle.fill")
										.foregroundColor(.gray)
								}
								
							}
						}
					} header: {
						Text("CB LESS")
					} footer: {
						Text("Total: \(cashRegister.totalCb_less.formatted())")
							.foregroundColor(.black)
					}
				}
				.listStyle(.insetGrouped)
				.padding(.top, 16)
			}
			.padding(.top, -25)
			
		}
	}
}

struct CashRegisterView_Previews: PreviewProvider {
	static var previews: some View {
		CashRegisterView(cashRegister: CashRegister())
	}
}
