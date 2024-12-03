//
//  CashFundView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 14/01/2023.
//

import SwiftUI

enum TypeValue {
    case HUNDRED, FIFTY, TWENTY, TEN, FIVE, TWO, ONE, FIFTYCOIN, TWENTYCOIN,
        TENCOIN, FIVECENTCOIN, TWOCENTCOIN, ONECENTCOIN
}

struct CashFundView: View {
    @Bindable var cashfund: CashFund

    private let denominations: [(typeValue: TypeValue, value: Double, color: Color)] = [
        (.HUNDRED, 100, Color("YellowCat")),
        (.FIFTY, 50, Color("PrimaryAccentColor")),
        (.TWENTY, 20, Color("Flamingo")),
        (.TEN, 10, Color("MauveCat")),
        (.FIVE, 5, Color("GreenCat")),
        (.TWO, 2, Color("PeachCat")),
        (.ONE, 1, Color("SecondaryAccentColor")),
        (.FIFTYCOIN, 0.5, Color("RedCat")),
        (.TWENTYCOIN, 0.2, Color("MauveCat")),
        (.TENCOIN, 0.1, Color("MaroonCat")),
        (.FIVECENTCOIN, 0.05, Color("PinkCat")),
        (.TWOCENTCOIN, 0.02, Color("Flamingo")),
        (.ONECENTCOIN, 0.01, Color("GreenCat"))
    ]

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Montant initial du fond de caisse :")) {
                    TextField(
                        "0", value: $cashfund.textFieldCashFund, format: .number
                    )
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .listRowBackground(Color.secondaryBackground)
                }

                Section(header: Text("Billets et pieces :")) {
                    ForEach(denominations, id: \.typeValue) { denomination in
                        CashFundFieldView(
                            cashfund: cashfund, 
                            typeValue: denomination.typeValue, 
                            value: denomination.value, 
                            color: denomination.color
                        )
                    }
                }
            }
            .navigationTitle("Fond")
            .scrollIndicators(.hidden)
            .background(Color.base)
            .foregroundStyle(Color("TextColor"))
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(
                        action: { hideKeyboard() },
                        label: { Image(systemName: "arrow.down.circle") }
                    )
                }
                
                ToolbarItemGroup(placement: .topBarLeading) {
                    HStack {
                        Text("Total :")
                        Text(cashfund.total.formatted(.currency(code: "EUR")))
                    }
                    .font(.callout)
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    HStack {
                        Text("Différence :")
                        Text(cashfund.differenceCalcul)
                    }
                    .foregroundStyle(cashfund.isPositiveDiff ? .green : .accentColor)
                    .font(.caption)
                }
            }
            .toolbarBackground(Color.base, for: .navigationBar)
            .toolbarBackground(Color.base, for: .tabBar)
        }
    }
}

#Preview {
    CashFundView(cashfund: CashFund())
}
