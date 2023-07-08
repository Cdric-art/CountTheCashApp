//
//  FooterCashRegister.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 15/06/2023.
//

import SwiftUI

struct HeaderCashRegister: View {
	@ObservedObject var cashRegisterData: CashRegisterViewModel

    var body: some View {
        HStack {
            HStack {
                Text("Total :")
                Text(cashRegisterData.resultTotal().formatted(.currency(code: "EUR")))
            }
            
            Spacer()
            
            HStack {
                Text("Différence :")
                Text(cashRegisterData.isPositiveDiff() ? "+\(cashRegisterData.diff().formatted(.currency(code: "EUR")))" : cashRegisterData.diff().formatted(.currency(code: "EUR")))
            }
            .foregroundColor(cashRegisterData.isPositiveDiff() ? .green : .black.opacity(0.6))
        }
        .font(.caption)
    }
}

