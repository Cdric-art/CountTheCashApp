	//
	//  CashFundView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashFundView: View {
	@StateObject var viewModel = CashFundViewModel()
	
	var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    TextField("Montant", value: $viewModel.textFieldCashFund, format: .number)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 100)
                        .font(.callout)
                }
                
                Divider()
                
                ScrollView {
                    VStack(spacing: 18) {
                        HStack {
                            TextField("0", value: $viewModel.bills.twenty, format: .number)
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
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        
                        HStack {
                            TextField("0", value: $viewModel.bills.ten, format: .number)
                                .onChange(of: viewModel.bills.ten)  { _ in
                                    if viewModel.bills.ten == 0 {
                                        viewModel.additionResults.tenBill = 0
                                        viewModel.totalAddition()
                                    } else {
                                        viewModel.additionResults.tenBill = Double(viewModel.bills.ten ?? 0) * 10.0
                                        viewModel.totalAddition()
                                    }
                                }
                                .frame(maxWidth: 50)
                            Text("x")
                            Text("10")
                            Spacer()
                            Text("=")
                            Text(viewModel.additionResults.tenBill.formatted(.currency(code: "EUR")))
                                .frame(width: 100, alignment: .trailing)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        
                        HStack {
                            TextField("0", value: $viewModel.bills.five, format: .number)
                                .onChange(of: viewModel.bills.five)  { _ in
                                    if viewModel.bills.five == 0 {
                                        viewModel.additionResults.fiveBill = 0
                                        viewModel.totalAddition()
                                    } else {
                                        viewModel.additionResults.fiveBill = Double(viewModel.bills.five ?? 0) * 5.0
                                        viewModel.totalAddition()
                                    }
                                }
                                .frame(maxWidth: 50)
                            Text("x")
                            Text(" 5")
                            Spacer()
                            Text("=")
                            Text(viewModel.additionResults.fiveBill.formatted(.currency(code: "EUR")))
                                .frame(width: 100, alignment: .trailing)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        
                        HStack {
                            TextField("0", value: $viewModel.coins.two, format: .number)
                                .onChange(of: viewModel.coins.two)  { _ in
                                    if viewModel.coins.two == 0 {
                                        viewModel.additionResults.twoCoin = 0
                                        viewModel.totalAddition()
                                    } else {
                                        viewModel.additionResults.twoCoin = Double(viewModel.coins.two ?? 0) * 2.0
                                        viewModel.totalAddition()
                                    }
                                }
                                .frame(maxWidth: 50)
                            Text("x")
                            Text(" 2")
                            Spacer()
                            Text("=")
                            Text(viewModel.additionResults.twoCoin.formatted(.currency(code: "EUR")))
                                .frame(width: 100, alignment: .trailing)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        
                        HStack {
                            TextField("0", value: $viewModel.coins.one, format: .number)
                                .onChange(of: viewModel.coins.one)  { _ in
                                    if viewModel.coins.one == 0 {
                                        viewModel.additionResults.oneCoin = 0
                                        viewModel.totalAddition()
                                    } else {
                                        viewModel.additionResults.oneCoin = Double(viewModel.coins.one ?? 0) * 1.0
                                        viewModel.totalAddition()
                                    }
                                }
                                .frame(maxWidth: 50)
                            Text("x")
                            Text(" 1")
                            Spacer()
                            Text("=")
                            Text(viewModel.additionResults.oneCoin.formatted(.currency(code: "EUR")))
                                .frame(width: 100, alignment: .trailing)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        
                        HStack {
                            TextField("0", value: $viewModel.coins.fifty, format: .number)
                                .onChange(of: viewModel.coins.fifty)  { _ in
                                    if viewModel.coins.fifty == 0 {
                                        viewModel.additionResults.fiftyCentCoin = 0
                                        viewModel.totalAddition()
                                    } else {
                                        viewModel.additionResults.fiftyCentCoin = Double(viewModel.coins.fifty ?? 0) * 0.5
                                        viewModel.totalAddition()
                                    }
                                }
                                .frame(maxWidth: 50)
                            Text("x")
                            Text("0.50")
                            Spacer()
                            Text("=")
                            Text(viewModel.additionResults.fiftyCentCoin.formatted(.currency(code: "EUR")))
                                .frame(width: 100, alignment: .trailing)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        
                        HStack {
                            TextField("0", value: $viewModel.coins.twenty, format: .number)
                                .onChange(of: viewModel.coins.twenty)  { _ in
                                    if viewModel.coins.twenty == 0 {
                                        viewModel.additionResults.twentyCentCoin = 0
                                        viewModel.totalAddition()
                                    } else {
                                        viewModel.additionResults.twentyCentCoin = Double(viewModel.coins.twenty ?? 0) * 0.2
                                        viewModel.totalAddition()
                                    }
                                }
                                .frame(maxWidth: 50)
                            Text("x")
                            Text("0.20")
                            Spacer()
                            Text("=")
                            Text(viewModel.additionResults.twentyCentCoin.formatted(.currency(code: "EUR")))
                                .frame(width: 100, alignment: .trailing)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        
                        HStack {
                            TextField("0", value: $viewModel.coins.ten, format: .number)
                                .onChange(of: viewModel.coins.ten)  { _ in
                                    if viewModel.coins.ten == 0 {
                                        viewModel.additionResults.tenCentCoin = 0
                                        viewModel.totalAddition()
                                    } else {
                                        viewModel.additionResults.tenCentCoin = Double(viewModel.coins.ten ?? 0) * 0.1
                                        viewModel.totalAddition()
                                    }
                                }
                                .frame(maxWidth: 50)
                            Text("x")
                            Text("0.10")
                            Spacer()
                            Text("=")
                            Text(viewModel.additionResults.tenCentCoin.formatted(.currency(code: "EUR")))
                                .frame(width: 100, alignment: .trailing)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                    }
                    .keyboardType(.decimalPad)
                    .padding()
                }
                .padding(.horizontal, 24)
                .padding(.top, 8)
                .scrollDismissesKeyboard(.interactively)

                
                Divider()
                
                FooterCashFundView(cashFund: viewModel)
            }
            .navigationTitle("Fond de caisse")
            .navigationBarTitleDisplayMode(.inline)
        }
	}
}

struct CashFundView_Previews: PreviewProvider {
	static var previews: some View {
		CashFundView(viewModel: CashFundViewModel())
	}
}
