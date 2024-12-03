//
//  CashFundFieldView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 11/10/2023.
//

import SwiftUI

struct CashFundFieldView: View {
    @Bindable var cashfund: CashFund
    var typeValue: TypeValue
    var value: Double
    var color: Color
    
    private var denominationInfo: (binding: Binding<Int?>, additionResult: Double, formattedAdditionResult: String) {
        switch typeValue {
        case .HUNDRED:
            return (
                $cashfund.bills.hundred, 
                Double(cashfund.bills.hundred ?? 0) * value, 
                (Double(cashfund.bills.hundred ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .FIFTY:
            return (
                $cashfund.bills.fifty, 
                Double(cashfund.bills.fifty ?? 0) * value, 
                (Double(cashfund.bills.fifty ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .TWENTY:
            return (
                $cashfund.bills.twenty, 
                Double(cashfund.bills.twenty ?? 0) * value, 
                (Double(cashfund.bills.twenty ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .TEN:
            return (
                $cashfund.bills.ten, 
                Double(cashfund.bills.ten ?? 0) * value, 
                (Double(cashfund.bills.ten ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .FIVE:
            return (
                $cashfund.bills.five, 
                Double(cashfund.bills.five ?? 0) * value, 
                (Double(cashfund.bills.five ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .TWO:
            return (
                $cashfund.coins.two, 
                Double(cashfund.coins.two ?? 0) * value, 
                (Double(cashfund.coins.two ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .ONE:
            return (
                $cashfund.coins.one, 
                Double(cashfund.coins.one ?? 0) * value, 
                (Double(cashfund.coins.one ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .FIFTYCOIN:
            return (
                $cashfund.coins.fifty, 
                Double(cashfund.coins.fifty ?? 0) * value, 
                (Double(cashfund.coins.fifty ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .TWENTYCOIN:
            return (
                $cashfund.coins.twenty, 
                Double(cashfund.coins.twenty ?? 0) * value, 
                (Double(cashfund.coins.twenty ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .TENCOIN:
            return (
                $cashfund.coins.ten, 
                Double(cashfund.coins.ten ?? 0) * value, 
                (Double(cashfund.coins.ten ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .FIVECENTCOIN:
            return (
                $cashfund.coins.fiveCent, 
                Double(cashfund.coins.fiveCent ?? 0) * value, 
                (Double(cashfund.coins.fiveCent ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .TWOCENTCOIN:
            return (
                $cashfund.coins.twoCent, 
                Double(cashfund.coins.twoCent ?? 0) * value, 
                (Double(cashfund.coins.twoCent ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        case .ONECENTCOIN:
            return (
                $cashfund.coins.oneCent, 
                Double(cashfund.coins.oneCent ?? 0) * value, 
                (Double(cashfund.coins.oneCent ?? 0) * value).formatted(.currency(code: "EUR"))
            )
        }
    }
    
    var body: some View {
        HStack {
            TextField("0", value: denominationInfo.binding, format: .number)
                .onChange(of: denominationInfo.binding.wrappedValue) { oldValue, newValue in
                    updateAdditionResult(newValue)
                }
                .frame(maxWidth: 50)
            Text("x")
            Text(value.formatted(.currency(code: "EUR")))
            Spacer()
            Text("=")
            Text(denominationInfo.formattedAdditionResult)
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .listRowBackground(Color.secondaryBackground)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(color, lineWidth: 1)
        )
    }
    
    private func updateAdditionResult(_ newValue: Int?) {
        switch typeValue {
        case .HUNDRED:
            cashfund.additionResults.hundredBill = Double(newValue ?? 0) * value
        case .FIFTY:
            cashfund.additionResults.fiftyBill = Double(newValue ?? 0) * value
        case .TWENTY:
            cashfund.additionResults.twentyBill = Double(newValue ?? 0) * value
        case .TEN:
            cashfund.additionResults.tenBill = Double(newValue ?? 0) * value
        case .FIVE:
            cashfund.additionResults.fiveBill = Double(newValue ?? 0) * value
        case .TWO:
            cashfund.additionResults.twoCoin = Double(newValue ?? 0) * value
        case .ONE:
            cashfund.additionResults.oneCoin = Double(newValue ?? 0) * value
        case .FIFTYCOIN:
            cashfund.additionResults.fiftyCentCoin = Double(newValue ?? 0) * value
        case .TWENTYCOIN:
            cashfund.additionResults.twentyCentCoin = Double(newValue ?? 0) * value
        case .TENCOIN:
            cashfund.additionResults.tenCentCoin = Double(newValue ?? 0) * value
        case .FIVECENTCOIN:
            cashfund.additionResults.fiveCentCoin = Double(newValue ?? 0) * value
        case .TWOCENTCOIN:
            cashfund.additionResults.twoCentCoin = Double(newValue ?? 0) * value
        case .ONECENTCOIN:
            cashfund.additionResults.oneCentCoin = Double(newValue ?? 0) * value
        }
        cashfund.totalAddition()
    }
}
