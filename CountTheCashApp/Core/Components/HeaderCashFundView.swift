//
//  FooterView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 15/06/2023.
//

import SwiftUI

struct HeaderCashFundView: View {
	@ObservedObject var cashFund: CashFundViewModel
	
    var body: some View {
		HStack {
			HStack {
				Text("Total :")
				Text(cashFund.total.formatted(.currency(code: "EUR")))
			}
            
            Spacer()
			
			HStack {
				Text("Différence :")
				Text(cashFund.differenceCalcul().formatted(.currency(code: "EUR")))
			}
			.foregroundColor(.black.opacity(0.6))
		}
        .font(.caption)
    }
}

