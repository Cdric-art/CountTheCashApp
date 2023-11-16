//
//  CashFundField.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 29/06/2023.
//

import SwiftUI

struct CashFundField: View {
    @Binding var viewModel: CashFundViewModel
    let value: Int?
    
    var body: some View {
        HStack {
            TextField("0", value: "\($viewModel)\(value)", format: .number)
                .onChange(of: viewModel.bills.twenty)  { _ in
                    if viewModel.bills.twenty == 0 {
                        viewModel.additionResults.twentyBill = 0
                        viewModel.totalAddition()
                    } else {
                        viewModel.additionResults.twentyBill = Double(viewModel.bills.twenty ?? 0) * 20.0
                        viewModel.totalAddition()
                    }
                }
                .frame(maxWidth: 50)
            Text("x")
            Text("20")
            Spacer()
            Text("=")
            Text(viewModel.additionResults.twentyBill.formatted(.currency(code: "EUR")))
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .listRowInsets(.init(top: 10, leading: 30, bottom: 10, trailing: 30))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.purple, lineWidth: 1)
        )
    }
}

struct CashFundField_Previews: PreviewProvider {
    static var previews: some View {
        CashFundField(viewModel: .constant(CashFundViewModel()), value: 0)
    }
}
