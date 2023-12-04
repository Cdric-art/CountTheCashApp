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
    
    var filteredTypeValueBinding: Binding<Int?> {
        switch typeValue {
            case .HUNDRED:
                return $cashfund.bills.hundred
            case .FIFTY:
                return $cashfund.bills.fifty
            case .TWENTY:
                return $cashfund.bills.twenty
            case .TEN:
                return $cashfund.bills.ten
            case .FIVE:
                return $cashfund.bills.five
            case .TWO:
                return $cashfund.coins.two
            case .ONE:
                return $cashfund.coins.one
            case .FIFTYCOIN:
                return $cashfund.coins.fifty
            case .TWENTYCOIN:
                return $cashfund.coins.twenty
            case .TENCOIN:
                return $cashfund.coins.ten
            case .FIVECENTCOIN:
                return $cashfund.coins.fiveCent
            case .TWOCENTCOIN:
                return $cashfund.coins.twoCent
            case .ONECENTCOIN:
                return $cashfund.coins.oneCent
        }
    }
    
    var filteredTypeValue: Int? {
        switch typeValue {
            case .HUNDRED:
                return cashfund.bills.hundred
            case .FIFTY:
                return cashfund.bills.fifty
            case .TWENTY:
                return cashfund.bills.twenty
            case .TEN:
                return cashfund.bills.ten
            case .FIVE:
                return cashfund.bills.five
            case .TWO:
                return cashfund.coins.two
            case .ONE:
                return cashfund.coins.one
            case .FIFTYCOIN:
                return cashfund.coins.fifty
            case .TWENTYCOIN:
                return cashfund.coins.twenty
            case .TENCOIN:
                return cashfund.coins.ten
            case .FIVECENTCOIN:
                return cashfund.coins.fiveCent
            case .TWOCENTCOIN:
                return cashfund.coins.twoCent
            case .ONECENTCOIN:
                return cashfund.coins.oneCent
        }
    }
    
    var additionResultReset: Void {
        switch typeValue {
            case .HUNDRED:
                cashfund.additionResults.hundredBill = 0
            case .FIFTY:
                cashfund.additionResults.fiftyBill = 0
            case .TWENTY:
                cashfund.additionResults.twentyBill = 0
            case .TEN:
                cashfund.additionResults.tenBill = 0
            case .FIVE:
                cashfund.additionResults.fiveBill = 0
            case .TWO:
                cashfund.additionResults.twoCoin = 0
            case .ONE:
                cashfund.additionResults.oneCoin = 0
            case .FIFTYCOIN:
                cashfund.additionResults.fiftyCentCoin = 0
            case .TWENTYCOIN:
                cashfund.additionResults.twentyCentCoin = 0
            case .TENCOIN:
                cashfund.additionResults.tenCentCoin = 0
            case .FIVECENTCOIN:
                cashfund.additionResults.fiveCentCoin = 0
            case .TWOCENTCOIN:
                cashfund.additionResults.twoCentCoin = 0
            case .ONECENTCOIN:
                cashfund.additionResults.oneCentCoin = 0
        }
    }
    
    var additionResult: Void {
        switch typeValue {
            case .HUNDRED:
                cashfund.additionResults.hundredBill = Double(filteredTypeValue ?? 0) * value
            case .FIFTY:
                cashfund.additionResults.fiftyBill = Double(filteredTypeValue ?? 0) * value
            case .TWENTY:
                cashfund.additionResults.twentyBill = Double(filteredTypeValue ?? 0) * value
            case .TEN:
                cashfund.additionResults.tenBill = Double(filteredTypeValue ?? 0) * value
            case .FIVE:
                cashfund.additionResults.fiveBill = Double(filteredTypeValue ?? 0) * value
            case .TWO:
                cashfund.additionResults.twoCoin = Double(filteredTypeValue ?? 0) * value
            case .ONE:
                cashfund.additionResults.oneCoin = Double(filteredTypeValue ?? 0) * value
            case .FIFTYCOIN:
                cashfund.additionResults.fiftyCentCoin = Double(filteredTypeValue ?? 0) * value
            case .TWENTYCOIN:
                cashfund.additionResults.twentyCentCoin = Double(filteredTypeValue ?? 0) * value
            case .TENCOIN:
                cashfund.additionResults.tenCentCoin = Double(filteredTypeValue ?? 0) * value
            case .FIVECENTCOIN:
                cashfund.additionResults.fiveCentCoin = Double(filteredTypeValue ?? 0) * value
            case .TWOCENTCOIN:
                cashfund.additionResults.twoCentCoin = Double(filteredTypeValue ?? 0) * value
            case .ONECENTCOIN:
                cashfund.additionResults.oneCentCoin = Double(filteredTypeValue ?? 0) * value
        }
    }
    
    var additionResultString: String {
        switch typeValue {
            case .HUNDRED:
                cashfund.additionResults.hundredBill.formatted(.currency(code: "EUR"))
            case .FIFTY:
                cashfund.additionResults.fiftyBill.formatted(.currency(code: "EUR"))
            case .TWENTY:
                cashfund.additionResults.twentyBill.formatted(.currency(code: "EUR"))
            case .TEN:
                cashfund.additionResults.tenBill.formatted(.currency(code: "EUR"))
            case .FIVE:
                cashfund.additionResults.fiveBill.formatted(.currency(code: "EUR"))
            case .TWO:
                cashfund.additionResults.twoCoin.formatted(.currency(code: "EUR"))
            case .ONE:
                cashfund.additionResults.oneCoin.formatted(.currency(code: "EUR"))
            case .FIFTYCOIN:
                cashfund.additionResults.fiftyCentCoin.formatted(.currency(code: "EUR"))
            case .TWENTYCOIN:
                cashfund.additionResults.twentyCentCoin.formatted(.currency(code: "EUR"))
            case .TENCOIN:
                cashfund.additionResults.tenCentCoin.formatted(.currency(code: "EUR"))
            case .FIVECENTCOIN:
                cashfund.additionResults.fiveCentCoin.formatted(.currency(code: "EUR"))
            case .TWOCENTCOIN:
                cashfund.additionResults.twoCentCoin.formatted(.currency(code: "EUR"))
            case .ONECENTCOIN:
                cashfund.additionResults.oneCentCoin.formatted(.currency(code: "EUR"))
        }
    }
    
    var body: some View {
        HStack {
            TextField("0", value: filteredTypeValueBinding, format: .number)
                .onChange(of: filteredTypeValue) {
                    if filteredTypeValue == 0 {
                        additionResultReset
                        cashfund.totalAddition()
                    } else {
                        additionResult
                        cashfund.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text(value.formatted(.currency(code: "EUR")))
            Spacer()
            Text("=")
            Text(additionResultString)
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(color, lineWidth: 1)
        )
    }
}
