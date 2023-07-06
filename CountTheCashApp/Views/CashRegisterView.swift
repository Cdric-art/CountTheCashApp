	//
	//  CashRegisterView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashRegisterView: View {
	@StateObject var viewModel = CashRegisterViewModel()
    @FocusState var isInputActive: Bool
	
	var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 24) {
                    TextField("Rapport", value: $viewModel.firstRapport, format: .number)
                        .frame(maxWidth: 100)
                        .focused($isInputActive)
                    TextField("Rapport", value: $viewModel.secondRapport, format: .number)
                        .frame(maxWidth: 100)
                        .focused($isInputActive)
                }
                .font(.callout)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Divider()
                
                HeaderCashRegister(cashRegisterData: viewModel)
                
                Divider()
                
                VStack {
                    List {
                        cbField()
                        cbLessField()
                        amexField()
                        amexLessField()
                        ticketRField()
                        cashField()
                    }
                    .listStyle(.plain)
                }
                
            }
            .navigationTitle("Caisse")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard, content: {
                    Spacer()
                    Button(action: {
                        isInputActive.toggle()
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
                    TextField("Montant", text: $viewModel.cb_emv[i])
                        .onChange(of: viewModel.cb_emv[i]) { value in
                            viewModel.cb_emv[i] = value.replacingOccurrences(of: ",", with: ".")
                            viewModel.saveTotal(type: .CBEMV)
                        }
                        .focused($isInputActive)
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
        .padding(.horizontal)
        .padding(.top, 12)
        .padding(.bottom, 4)
    }
    
    @ViewBuilder
    func cbLessField() -> some View {
        VStack(alignment: .leading) {
            
            Text("CB LESS")
                .font(.caption)
                .foregroundColor(.teal)
            
            ForEach(viewModel.cb_less.indices, id: \.self) { i in
                HStack {
                    TextField("Montant", text: $viewModel.cb_less[i])
                        .onChange(of: viewModel.cb_less[i]) { value in
                            viewModel.cb_less[i] = value.replacingOccurrences(of: ",", with: ".")
                            viewModel.saveTotal(type: .CBLESS)
                        }
                        .focused($isInputActive)
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
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    
    @ViewBuilder
    func amexField() -> some View {
        VStack(alignment: .leading) {
            
            Text("AMEX")
                .font(.caption)
                .foregroundColor(.brown)
            
            ForEach(viewModel.amex.indices, id: \.self) { i in
                HStack {
                    TextField("Montant", text: $viewModel.amex[i])
                        .onChange(of: viewModel.amex[i]) { value in
                            viewModel.amex[i] = value.replacingOccurrences(of: ",", with: ".")
                            viewModel.saveTotal(type: .AMEX)
                        }
                        .focused($isInputActive)
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
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    
    @ViewBuilder
    func amexLessField() -> some View {
        VStack(alignment: .leading) {
            
            Text("AMEX LESS")
                .font(.caption)
                .foregroundColor(.orange)
            
            ForEach(viewModel.amex_less.indices, id: \.self) { i in
                HStack {
                    TextField("Montant", text: $viewModel.amex_less[i])
                        .onChange(of: viewModel.amex_less[i]) { value in
                            viewModel.amex_less[i] = value.replacingOccurrences(of: ",", with: ".")
                            viewModel.saveTotal(type: .AMEXLESS)
                        }
                        .focused($isInputActive)
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
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    
    @ViewBuilder
    func ticketRField() -> some View {
        VStack(alignment: .leading) {
            
            Text("T. RESTAURANT")
                .foregroundColor(.mint)
                .font(.caption)
            
            ForEach(viewModel.ticketRestaurant.indices, id: \.self) { i in
                HStack {
                    TextField("Montant", text: $viewModel.ticketRestaurant[i])
                        .onChange(of: viewModel.ticketRestaurant[i]) { value in
                            viewModel.ticketRestaurant[i] = value.replacingOccurrences(of: ",", with: ".")
                            viewModel.saveTotal(type: .TICKETRESTAURANT)
                        }
                        .focused($isInputActive)
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
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    
    @ViewBuilder
    func cashField() -> some View {
        VStack(alignment: .leading) {
            
            Text("CASH")
                .font(.caption)
                .foregroundColor(.red)
            
            HStack {
                TextField("Montant", text: $viewModel.cash[0])
                    .onChange(of: viewModel.cash[0]) { value in
                        viewModel.cash[0] = value.replacingOccurrences(of: ",", with: ".")
                        viewModel.saveTotal(type: .CASH)
                    }
                    .focused($isInputActive)
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
        .listRowSeparator(.hidden, edges: .bottom)
        .padding(.horizontal)
        .padding(.top, 4)
        .padding(.bottom, 12)
    }
    
}

struct CashRegisterView_Previews: PreviewProvider {
	static var previews: some View {
		CashRegisterView(viewModel: CashRegisterViewModel())
	}
}
