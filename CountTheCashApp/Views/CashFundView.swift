//
//  CashFundView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 14/01/2023.
//

import SwiftUI

struct CashFundView: View {
    @Bindable var cashfund: CashFund
    
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
                    twentyField()
                    tenField()
                    fiveField()
                    twoCoinField()
                    oneCoinField()
                    fiftyCoinField()
                    twentyCoinField()
                    tenCoinField()
                    fiveCentCoinField()
                    twoCentCoinField()
                    oneCentCoinField()
                } header: {
                    Text("Billets et pieces :")
                }
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
    
    @ViewBuilder
    func twentyField() -> some View {
        HStack {
            TextField("0", value: $cashfund.bills.twenty, format: .number)
                .onChange(of: cashfund.bills.twenty) {
                    if cashfund.bills.twenty == 0 {
                        cashfund.additionResults.twentyBill = 0
                        cashfund.totalAddition()
                    } else {
                        cashfund.additionResults.twentyBill = Double(cashfund.bills.twenty ?? 0) * 20.0
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text("20")
            Spacer()
            Text("=")
            Text(cashfund.additionResults.twentyBill.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.purple, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    func tenField() -> some View {
        HStack {
            TextField("0", value: $cashfund.bills.ten, format: .number)
                .onChange(of: cashfund.bills.ten) {
                    if cashfund.bills.ten == 0 {
                        cashfund.additionResults.tenBill = 0
                        cashfund.totalAddition()
                    } else {
                        cashfund.additionResults.tenBill = Double(cashfund.bills.ten ?? 0) * 10.0
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text("10")
            Spacer()
            Text("=")
            Text(cashfund.additionResults.tenBill.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.cyan, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    func fiveField() -> some View {
        HStack {
            TextField("0", value: $cashfund.bills.five, format: .number)
                .onChange(of: cashfund.bills.five) {
                    if cashfund.bills.five == 0 {
                        cashfund.additionResults.fiveBill = 0
                        cashfund.totalAddition()
                    } else {
                        cashfund.additionResults.fiveBill = Double(cashfund.bills.five ?? 0) * 5.0
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text(" 5")
            Spacer()
            Text("=")
            Text(cashfund.additionResults.fiveBill.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.brown, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    func twoCoinField() -> some View {
        HStack {
            TextField("0", value: $cashfund.coins.two, format: .number)
                .onChange(of: cashfund.coins.two) {
                    if cashfund.coins.two == 0 {
                        cashfund.additionResults.twoCoin = 0
                        cashfund.totalAddition()
                    } else {
                        cashfund.additionResults.twoCoin = Double(cashfund.coins.two ?? 0) * 2.0
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text(" 2")
            Spacer()
            Text("=")
            Text(cashfund.additionResults.twoCoin.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.orange, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    func oneCoinField() -> some View {
        HStack {
            TextField("0", value: $cashfund.coins.one, format: .number)
                .onChange(of: cashfund.coins.one) {
                    if cashfund.coins.one == 0 {
                        cashfund.additionResults.oneCoin = 0
                        cashfund.totalAddition()
                    } else {
                        cashfund.additionResults.oneCoin = Double(cashfund.coins.one ?? 0) * 1.0
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text(" 1")
            Spacer()
            Text("=")
            Text(cashfund.additionResults.oneCoin.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.mint, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    func fiftyCoinField() -> some View {
        HStack {
            TextField("0", value: $cashfund.coins.fifty, format: .number)
                .onChange(of: cashfund.coins.fifty) {
                    if cashfund.coins.fifty == 0 {
                        cashfund.additionResults.fiftyCentCoin = 0
                        cashfund.totalAddition()
                    } else {
                        cashfund.additionResults.fiftyCentCoin = Double(cashfund.coins.fifty ?? 0) * 0.5
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text("0.50")
            Spacer()
            Text("=")
            Text(cashfund.additionResults.fiftyCentCoin.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.red, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    func twentyCoinField() -> some View {
        HStack {
            TextField("0", value: $cashfund.coins.twenty, format: .number)
                .onChange(of: cashfund.coins.twenty) {
                    if cashfund.coins.twenty == 0 {
                        cashfund.additionResults.twentyCentCoin = 0
                        cashfund.totalAddition()
                    } else {
                        cashfund.additionResults.twentyCentCoin = Double(cashfund.coins.twenty ?? 0) * 0.2
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text("0.20")
            Spacer()
            Text("=")
            Text(cashfund.additionResults.twentyCentCoin.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.green, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    func tenCoinField() -> some View {
        HStack {
            TextField("0", value: $cashfund.coins.ten, format: .number)
                .onChange(of: cashfund.coins.ten) {
                    if cashfund.coins.ten == 0 {
                        cashfund.additionResults.tenCentCoin = 0
                        cashfund.totalAddition()
                    } else {
                        cashfund.additionResults.tenCentCoin = Double(cashfund.coins.ten ?? 0) * 0.1
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text("0.10")
            Spacer()
            Text("=")
            Text(cashfund.additionResults.tenCentCoin.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.indigo, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    func fiveCentCoinField() -> some View {
        HStack {
            TextField("0", value: $cashfund.coins.fiveCent, format: .number)
                .onChange(of: cashfund.coins.fiveCent) {
                    if cashfund.coins.fiveCent == 0 {
                        cashfund.additionResults.fiveCentCoin = 0
                        cashfund.totalAddition()
                    } else {
                        cashfund.additionResults.fiveCentCoin = Double(cashfund.coins.fiveCent ?? 0) * 0.05
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text("0.05")
            Spacer()
            Text("=")
            Text(cashfund.additionResults.fiveCentCoin.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.secondary, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    func twoCentCoinField() -> some View {
        HStack {
            TextField("0", value: $cashfund.coins.twoCent, format: .number)
                .onChange(of: cashfund.coins.twoCent) {
                    if cashfund.coins.twoCent == 0 {
                        cashfund.additionResults.twoCentCoin = 0
                        cashfund.totalAddition()
                    } else {
                        cashfund.additionResults.twoCentCoin = Double(cashfund.coins.twoCent ?? 0) * 0.02
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text("0.02")
            Spacer()
            Text("=")
            Text(cashfund.additionResults.twoCentCoin.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.teal, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    func oneCentCoinField() -> some View {
        HStack {
            TextField("0", value: $cashfund.coins.oneCent, format: .number)
                .onChange(of: cashfund.coins.oneCent) {
                    if cashfund.coins.oneCent == 0 {
                        cashfund.additionResults.oneCentCoin = 0
                        cashfund.totalAddition()
                    } else {
                        cashfund.additionResults.oneCentCoin = Double(cashfund.coins.oneCent ?? 0) * 0.01
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text("0.01")
            Spacer()
            Text("=")
            Text(cashfund.additionResults.oneCentCoin.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .listRowSeparator(.hidden, edges: .bottom)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.orange, lineWidth: 1)
        )
    }
}

struct CashFundView_Previews: PreviewProvider {
    static var previews: some View {
        CashFundView(cashfund: CashFund())
    }
}
