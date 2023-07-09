	//
	//  CashRegisterView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashRegisterView: View {
	@StateObject var viewModel = CashRegisterViewModel()
	
	var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack{
                        TextField("0", value: $viewModel.firstRapport, format: .number)
                            .frame(maxWidth: 100)
                        Spacer()
                        Divider()
                        Spacer()
                        TextField("0", value: $viewModel.secondRapport, format: .number)
                            .frame(maxWidth: 100)
                    }
                    .font(.callout)
                    .multilineTextAlignment(.center)
                } header: {
                    Text("Montant du ou des rapports de caisses :")
                }
                
                Section {
                    cbField()
                    cbLessField()
                    amexField()
                    amexLessField()
                    ticketRField()
                    cashField()
                } header: {
                    Text("Montants des moyens de paiment :")
                }
                
            }
            .navigationTitle("Caisse")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading, content: {
                    HStack {
                        Text("Total :")
                        Text(viewModel.resultTotal().formatted(.currency(code: "EUR")))
                    }
                    .font(.caption)
                })
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    HStack {
                        Text("Différence :")
                        Text(viewModel.isPositiveDiff() ? "+\(viewModel.diff().formatted(.currency(code: "EUR")))" : viewModel.diff().formatted(.currency(code: "EUR")))
                    }
                    .foregroundColor(viewModel.isPositiveDiff() ? .green : .black.opacity(0.6))
                    .font(.caption)
                })
                ToolbarItemGroup(placement: .keyboard, content: {
                    Spacer()
                    Button(action: {
//                        isInputActive.toggle()
                        hideKeyboard()
                    }, label: {
                        Image(systemName: "arrow.down.circle")
                    })
                })
            }
        }
	}
    
    @ViewBuilder
    func cbField() -> some View {
        VStack(alignment: .leading) {
            
            Text("CB EMV")
                .font(.caption)
                .foregroundColor(.purple)
            
            ForEach(viewModel.cb_emv.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: $viewModel.cb_emv[i])
                        .onChange(of: viewModel.cb_emv[i]) { value in
                            viewModel.cb_emv[i] = value.replacingOccurrences(of: ",", with: ".")
                            viewModel.saveTotal(type: .CBEMV)
                        }
                    if i == 0 {
                        Button {
                            if viewModel.cb_emv[0] != "" {
                                viewModel.cb_emv.append("")
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
    }
    
    @ViewBuilder
    func cbLessField() -> some View {
        VStack(alignment: .leading) {
            
            Text("CB LESS")
                .font(.caption)
                .foregroundColor(.teal)
            
            ForEach(viewModel.cb_less.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: $viewModel.cb_less[i])
                        .onChange(of: viewModel.cb_less[i]) { value in
                            viewModel.cb_less[i] = value.replacingOccurrences(of: ",", with: ".")
                            viewModel.saveTotal(type: .CBLESS)
                        }
                    if i == 0 {
                        Button {
                            if viewModel.cb_less[0] != "" {
                                viewModel.cb_less.append("")
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
            
            Text("Total: \(viewModel.totalCbLess.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundColor(Color.teal)
        }
    }
    
    @ViewBuilder
    func amexField() -> some View {
        VStack(alignment: .leading) {
            
            Text("AMEX")
                .font(.caption)
                .foregroundColor(.brown)
            
            ForEach(viewModel.amex.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: $viewModel.amex[i])
                        .onChange(of: viewModel.amex[i]) { value in
                            viewModel.amex[i] = value.replacingOccurrences(of: ",", with: ".")
                            viewModel.saveTotal(type: .AMEX)
                        }
                    if i == 0 {
                        Button {
                            if viewModel.amex[0] != "" {
                                viewModel.amex.append("")
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
            
            Text("Total: \(viewModel.totalAmex.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundColor(Color.brown)
        }
    }
    
    @ViewBuilder
    func amexLessField() -> some View {
        VStack(alignment: .leading) {
            
            Text("AMEX LESS")
                .font(.caption)
                .foregroundColor(.orange)
            
            ForEach(viewModel.amex_less.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: $viewModel.amex_less[i])
                        .onChange(of: viewModel.amex_less[i]) { value in
                            viewModel.amex_less[i] = value.replacingOccurrences(of: ",", with: ".")
                            viewModel.saveTotal(type: .AMEXLESS)
                        }
                    if i == 0 {
                        Button {
                            if viewModel.amex_less[0] != "" {
                                viewModel.amex_less.append("")
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
            
            Text("Total: \(viewModel.totalAmexLess.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundColor(Color.orange)
            
        }
    }
    
    @ViewBuilder
    func ticketRField() -> some View {
        VStack(alignment: .leading) {
            
            Text("T. RESTAURANT")
                .foregroundColor(.mint)
                .font(.caption)
            
            ForEach(viewModel.ticketRestaurant.indices, id: \.self) { i in
                HStack {
                    TextField("0", text: $viewModel.ticketRestaurant[i])
                        .onChange(of: viewModel.ticketRestaurant[i]) { value in
                            viewModel.ticketRestaurant[i] = value.replacingOccurrences(of: ",", with: ".")
                            viewModel.saveTotal(type: .TICKETRESTAURANT)
                        }
                    if i == 0 {
                        Button {
                            if viewModel.ticketRestaurant[0] != "" {
                                viewModel.ticketRestaurant.append("")
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
            
            Text("Total: \(viewModel.totalTicketRestaurant.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundColor(Color.mint)
        }
    }
    
    @ViewBuilder
    func cashField() -> some View {
        VStack(alignment: .leading) {
            
            Text("CASH")
                .font(.caption)
                .foregroundColor(.red)
            
            HStack {
                TextField("0", text: $viewModel.cash[0])
                    .onChange(of: viewModel.cash[0]) { value in
                        viewModel.cash[0] = value.replacingOccurrences(of: ",", with: ".")
                        viewModel.saveTotal(type: .CASH)
                    }
                Button {
                    viewModel.cash[0] = ""
                } label: {
                    Image(systemName: "trash.circle")
                }
            }
            .padding(6)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.red, lineWidth: 1)
            )
            
            Text("Total: \(viewModel.totalCash.formatted(.currency(code: "EUR")))")
                .font(.caption2)
                .foregroundColor(Color.red)
        }
    }
    
}

struct CashRegisterView_Previews: PreviewProvider {
	static var previews: some View {
		CashRegisterView(viewModel: CashRegisterViewModel())
	}
}
