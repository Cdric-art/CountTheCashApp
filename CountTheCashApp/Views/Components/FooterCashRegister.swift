//
//  FooterCashRegister.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 15/06/2023.
//

import SwiftUI

struct FooterCashRegister: View {
	@ObservedObject var cashRegisterData: CashRegisterViewModel

    var body: some View {
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
		.padding(.horizontal)
		.padding(.bottom, 4)
    }
}

