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
                Section(header: Text("Montant du ou des rapports de caisses :")) {
                    HStack {
                        TextField("0", value: Binding(
                            get: { cashRegister.firstRapport },
                            set: { cashRegister.firstRapport = $0 }
                        ), format: .number)
                            .frame(maxWidth: 100)
                        Spacer()
                        Image(systemName: "plus")
                            .foregroundStyle(.black.opacity(0.2))
                            .bold()
                        Spacer()
                        TextField("0", value: Binding(
                            get: { cashRegister.secondRapport },
                            set: { cashRegister.secondRapport = $0 }
                        ), format: .number)
                            .frame(maxWidth: 100)
                    }
                    .font(.callout)
                    .multilineTextAlignment(.center)
                }
                .listRowBackground(Color.secondaryBackground)
                
                Section(header: Text("Total CA :")) {
                    HStack {
                        Text("\(cashRegister.totalRapport.formatted(.currency(code: "EUR")))")
                    }
                    .listRowBackground(Color.secondaryBackground)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Section(header: Text("Montants des moyens de paiment :")) {
                    paymentMethodField(
                        title: "CB EMV", 
                        color: Color("MauveCat"),
                        values: $cashRegister.cb_emv,
                        totalValue: cashRegister.totalCbEmv, 
                        paymentType: .CBEMV
                    )
                    paymentMethodField(
                        title: "CB LESS", 
                        color: Color("PrimaryAccentColor"),
                        values: $cashRegister.cb_less,
                        totalValue: cashRegister.totalCbLess, 
                        paymentType: .CBLESS
                    )
                    paymentMethodField(
                        title: "AMEX CONTACT", 
                        color: Color("MaroonCat"),
                        values: $cashRegister.amex,
                        totalValue: cashRegister.totalAmex, 
                        paymentType: .AMEX
                    )
                    paymentMethodField(
                        title: "AMEX EXPRESSPAY", 
                        color: Color("Flamingo"),
                        values: $cashRegister.amex_less,
                        totalValue: cashRegister.totalAmexLess, 
                        paymentType: .AMEXLESS
                    )
                    paymentMethodField(
                        title: "TICKETS RESTAURANT", 
                        color: Color("YellowCat"),
                        values: $cashRegister.ticketRestaurant,
                        totalValue: cashRegister.totalTicketRestaurant, 
                        paymentType: .TICKETRESTAURANT
                    )
                    paymentMethodField(
                        title: "DEPENSES", 
                        color: Color("GreenCat"),
                        values: $cashRegister.expenses,
                        totalValue: cashRegister.totalExpenses, 
                        paymentType: .EXPENSES
                    )
                    paymentMethodField(
                        title: "ESPECES", 
                        color: Color("PeachCat"),
                        values: $cashRegister.cash,
                        totalValue: cashRegister.totalCash, 
                        paymentType: .CASH
                    )
                }
                .listRowBackground(Color.secondaryBackground)

            }
            .navigationTitle("Caisse")
            .scrollIndicators(.hidden)
            .background(Color.base)
            .foregroundStyle(Color("TextColor"))
            .scrollContentBackground(.hidden)
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
            .toolbarBackground(Color.base, for: .navigationBar)
            .toolbarBackground(Color.base, for: .tabBar)
        }
    }
    
    private func paymentMethodField(title: String, color: Color, values: Binding<[String]>, totalValue: Double, paymentType: TYPE_PAYEMENT) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundStyle(color)
            
            ForEach(values.wrappedValue.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: values[i])
                        .onChange(of: values.wrappedValue[i]) { _, newState in
                            values.wrappedValue[i] = newState.replacingOccurrences(of: ",", with: ".")
                            cashRegister.saveTotal(type: paymentType)
                        }
                    if i == 0 {
                        Button {
                            if values.wrappedValue[0] != "" {
                                values.wrappedValue.append("")
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(color, lineWidth: 1)
                )
            }
            
            Text("Total: \(totalValue.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundStyle(color)
        }
    }
    
}

#Preview {
    CashRegisterView(cashRegister: CashRegister())
}
