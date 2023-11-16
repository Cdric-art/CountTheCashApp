//
//  CashFundView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 14/01/2023.
//

import SwiftUI

enum TypeValue {
    case TWENTY, TEN, FIVE, TWO, ONE, FIFTYCOIN, TWENTYCOIN, TENCOIN, FIVECENTCOIN, TWOCENTCOIN, ONECENTCOIN
}

struct CashFundView: View {
    @Bindable var cashfund: CashFund
    
    @State private var isTapGesture: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("0", value: $cashfund.textFieldCashFund, format: .number)
                        .font(.callout)
                } header: {
                    Text("Montant initial du fond de caisse :")
                }
                .multilineTextAlignment(.center)
                
                Section {
                    CashFundFieldView(cashfund: cashfund, typeValue: .TWENTY, value: 20, color: .purple)
                    CashFundFieldView(cashfund: cashfund, typeValue: .TEN, value: 10, color: .cyan)
                    CashFundFieldView(cashfund: cashfund, typeValue: .FIVE, value: 5, color: .brown)
                    CashFundFieldView(cashfund: cashfund, typeValue: .TWO, value: 2, color: .orange)
                    CashFundFieldView(cashfund: cashfund, typeValue: .ONE, value: 1, color: .mint)
                    CashFundFieldView(cashfund: cashfund, typeValue: .FIFTYCOIN, value: 0.5, color: .red)
                    CashFundFieldView(cashfund: cashfund, typeValue: .TWENTYCOIN, value: 0.2, color: .green)
                    CashFundFieldView(cashfund: cashfund, typeValue: .TENCOIN, value: 0.1, color: .indigo)
                    CashFundFieldView(cashfund: cashfund, typeValue: .FIVECENTCOIN, value: 0.05, color: .secondary)
                    CashFundFieldView(cashfund: cashfund, typeValue: .TWOCENTCOIN, value: 0.02, color: .teal)
                    CashFundFieldView(cashfund: cashfund, typeValue: .ONECENTCOIN, value: 0.01, color: .pink)
                } header: {
                    Text("Billets et pieces :")
                }
                
                ResetButton(isTapGesture: $isTapGesture, dataReset: {
                    cashfund.reset()
                })
                
            }
            .navigationTitle("Fond")
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(action: {
                        hideKeyboard()
                    }, label: {
                        Image(systemName: "arrow.down.circle")
                    })
                }
                ToolbarItemGroup(placement: .topBarLeading, content: {
                    HStack {
                        Text("Total :")
                        Text(cashfund.total.formatted(.currency(code: "EUR")))
                    }
                    .font(.callout)
                })
                ToolbarItemGroup(placement: .topBarTrailing, content: {
                    HStack {
                        Text("Différence :")
                        Text(cashfund.differenceCalcul)
                    }
                    .foregroundStyle(cashfund.isPositiveDiff ? .green : .accentColor)
                    .font(.caption)
                })
            }
        }
        
    }
}

struct CashFundView_Previews: PreviewProvider {
    static var previews: some View {
        CashFundView(cashfund: CashFund())
    }
}
