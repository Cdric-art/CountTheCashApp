//
//  RegisterField.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 29/06/2023.
//

import SwiftUI

struct RegisterField: View {
    @EnvironmentObject var viewModel: CashRegisterViewModel
    @Binding var type: [String]
    let text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(text)
                .font(.caption)
                .foregroundColor(.purple)
            
            ForEach(type.indices, id: \.self) { i in
                HStack {
                    TextField("Montant", text: $type[i])
                        .onChange(of: $type[i]) { value in
                            $type[i] = value.replacingOccurrences(of: ",", with: ".")
                            viewModel.saveTotal(type: .CBEMV)
                        }
                    if i == 0 {
                        Button {
                            if type[0] != "" {
                                type.append("")
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.purple, lineWidth: 1)
                )
            }
            
            Text("Total: \(viewModel.totalCbEmv.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundColor(Color.purple)
        }
        .padding(.horizontal)
        .padding(.top, 12)
        .padding(.bottom, 4)
    }
}

struct RegisterField_Previews: PreviewProvider {
    static var previews: some View {
        RegisterField(type: .constant(CashRegisterViewModel().cb_emv), text: "CB EMV")
    }
}
