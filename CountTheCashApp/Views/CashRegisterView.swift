//
//  CashRegisterView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 14/01/2023.
//

import SwiftUI

struct CashRegisterView: View {
    @Bindable var cashRegister: CashRegister
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack{
                        TextField("0", value: $cashRegister.firstRapport, format: .number)
                            .frame(maxWidth: 100)
                        Spacer()
                        Image(systemName: "plus")
                            .foregroundStyle(.black.opacity(0.2))
                            .bold()
                        Spacer()
                        TextField("0", value: $cashRegister.secondRapport, format: .number)
                            .frame(maxWidth: 100)
                    }
                    .font(.callout)
                    .multilineTextAlignment(.center)
                } header: {
                    Text("Montant du ou des rapports de caisses :")
                }
                
                Section {
                    HStack {
                        Text("\(cashRegister.totalRapport.formatted(.currency(code: "EUR")))")
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                } header: {
                    Text("Total CA :")
                }
                
                Section {
                    cbField()
                    cbLessField()
                    amexField()
                    amexLessField()
                    ticketRField()
                    expensesField()
                    cashField()
                } header: {
                    Text("Montants des moyens de paiment :")
                }
                
            }
            .navigationTitle("Caisse")
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
                        Text(cashRegister.totalCaisse.formatted(.currency(code: "EUR")))
                    }
                    .font(.callout)
                })
                ToolbarItemGroup(placement: .topBarTrailing, content: {
                    HStack {
                        Text("Différence :")
                        Text(cashRegister.diff)
                    }
                    .foregroundStyle(cashRegister.isPositiveDiff ? .green : .accentColor)
                    .font(.caption)
                })
            }
        }
    }
    
    func cbField() -> some View {
        VStack(alignment: .leading) {
            
            Text("CB EMV")
                .font(.caption)
                .foregroundStyle(.purple)
            
            ForEach(cashRegister.cb_emv.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: $cashRegister.cb_emv[i])
                        .onChange(of: cashRegister.cb_emv[i]) { _, newState in
                            cashRegister.cb_emv[i] = newState.replacingOccurrences(of: ",", with: ".")
                            cashRegister.saveTotal(type: .CBEMV)
                        }
                    if i == 0 {
                        Button {
                            if cashRegister.cb_emv[0] != "" {
                                cashRegister.cb_emv.append("")
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
            
            Text("Total: \(cashRegister.totalCbEmv.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundStyle(Color.purple)
        }
    }
    
    func cbLessField() -> some View {
        VStack(alignment: .leading) {
            
            Text("CB LESS")
                .font(.caption)
                .foregroundStyle(.teal)
            
            ForEach(cashRegister.cb_less.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: $cashRegister.cb_less[i])
                        .onChange(of: cashRegister.cb_less[i]) { _, newState in
                            cashRegister.cb_less[i] = newState.replacingOccurrences(of: ",", with: ".")
                            cashRegister.saveTotal(type: .CBLESS)
                        }
                    if i == 0 {
                        Button {
                            if cashRegister.cb_less[0] != "" {
                                cashRegister.cb_less.append("")
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.teal, lineWidth: 1)
                )
            }
            
            Text("Total: \(cashRegister.totalCbLess.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundStyle(Color.teal)
        }
    }
    
    func amexField() -> some View {
        VStack(alignment: .leading) {
            
            Text("AMEX CONTACT")
                .font(.caption)
                .foregroundStyle(.brown)
            
            ForEach(cashRegister.amex.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: $cashRegister.amex[i])
                        .onChange(of: cashRegister.amex[i]) { _, newState in
                            cashRegister.amex[i] = newState.replacingOccurrences(of: ",", with: ".")
                            cashRegister.saveTotal(type: .AMEX)
                        }
                    if i == 0 {
                        Button {
                            if cashRegister.amex[0] != "" {
                                cashRegister.amex.append("")
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.brown, lineWidth: 1)
                )
            }
            
            Text("Total: \(cashRegister.totalAmex.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundStyle(Color.brown)
        }
    }
    
    func amexLessField() -> some View {
        VStack(alignment: .leading) {
            
            Text("AMEX EXPRESSPAY")
                .font(.caption)
                .foregroundStyle(.orange)
            
            ForEach(cashRegister.amex_less.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: $cashRegister.amex_less[i])
                        .onChange(of: cashRegister.amex_less[i]) { _, newState in
                            cashRegister.amex_less[i] = newState.replacingOccurrences(of: ",", with: ".")
                            cashRegister.saveTotal(type: .AMEXLESS)
                        }
                    if i == 0 {
                        Button {
                            if cashRegister.amex_less[0] != "" {
                                cashRegister.amex_less.append("")
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.orange, lineWidth: 1)
                )
            }
            
            Text("Total: \(cashRegister.totalAmexLess.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundStyle(Color.orange)
            
        }
    }
    
    func ticketRField() -> some View {
        VStack(alignment: .leading) {
            
            Text("TICKETS RESTAURANT")
                .foregroundStyle(.mint)
                .font(.caption)
            
            ForEach(cashRegister.ticketRestaurant.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: $cashRegister.ticketRestaurant[i])
                        .onChange(of: cashRegister.ticketRestaurant[i]) { _, newState in
                            cashRegister.ticketRestaurant[i] = newState.replacingOccurrences(of: ",", with: ".")
                            cashRegister.saveTotal(type: .TICKETRESTAURANT)
                        }
                    if i == 0 {
                        Button {
                            if cashRegister.ticketRestaurant[0] != "" {
                                cashRegister.ticketRestaurant.append("")
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.mint, lineWidth: 1)
                )
            }
            
            Text("Total: \(cashRegister.totalTicketRestaurant.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundStyle(Color.mint)
        }
    }
    
    func expensesField() -> some View {
        VStack(alignment: .leading) {
            
            Text("DEPENSES")
                .foregroundStyle(.yellow)
                .font(.caption)
            
            ForEach(cashRegister.expenses.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: $cashRegister.expenses[i])
                        .onChange(of: cashRegister.expenses[i]) { _, newState in
                            cashRegister.expenses[i] = newState.replacingOccurrences(of: ",", with: ".")
                            cashRegister.saveTotal(type: .EXPENSES)
                        }
                    if i == 0 {
                        Button {
                            if cashRegister.expenses[0] != "" {
                                cashRegister.expenses.append("")
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.yellow, lineWidth: 1)
                )
            }
            
            Text("Total: \(cashRegister.totalExpenses.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundStyle(Color.yellow)
        }
    }
    
    func cashField() -> some View {
        VStack(alignment: .leading) {
            
            Text("ESPECES")
                .font(.caption)
                .foregroundStyle(.red)
            
            HStack {
                TextField("0", text: $cashRegister.cash[0])
                    .onChange(of: cashRegister.cash[0]) { _, newState in
                        cashRegister.cash[0] = newState.replacingOccurrences(of: ",", with: ".")
                        cashRegister.saveTotal(type: .CASH)
                    }
                Button {
                    cashRegister.cash[0] = ""
                } label: {
                    Image(systemName: "trash.circle")
                }
            }
            .padding(6)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.red, lineWidth: 1)
            )
            
            Text("Total: \(cashRegister.totalCash.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundStyle(Color.red)
        }
    }
    
}

struct CashRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        CashRegisterView(cashRegister: CashRegister())
    }
}
