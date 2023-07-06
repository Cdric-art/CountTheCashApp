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
		VStack(spacing: 2) {
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
			.foregroundColor(.black.opacity(0.6))
		}
		.padding(.horizontal)
		.padding(.bottom, 4)
    }
}

