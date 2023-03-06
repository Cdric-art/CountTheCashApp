	//
	//  ContentView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 13/01/2023.
	//

import SwiftUI

struct ContentView: View {
	
	@StateObject var login = LoginViewModel()
	@StateObject var cashFund = CashFundViewModel()
	@StateObject var cashRegister = CashRegisterViewModel()
	
	var body: some View {
		
		NavigationStack {
			ZStack {
				
				CircleBackground()
				
				VStack {
					TitleView(title: "Compte ta caisse", icon: "cashIcon", color: .white)
					
					Spacer()
						.frame(height: 100.0)
					
					VStack(spacing: 32) {
						NavigationLink(destination: CashFundView(cashFund: cashFund), label: {
							NavigationLinkLabel(imageName: "dollarsign.arrow.circlepath", color: "secondaryColor", title: "Fond de caisse")
						})
						
						NavigationLink(destination: CashRegisterView(cashRegisterData: cashRegister), label: {
							NavigationLinkLabel(imageName: "dollarsign.square.fill", color: "primaryColor", title: "Caisse")
						})
					}
					
					Spacer()
				}
			}
			.toolbar(content: {
				ToolbarItem(placement: .navigationBarTrailing, content: {
					NavigationLink(destination: LoginView(login: LoginViewModel()), label: {
						Image(systemName: "person.circle")
							.foregroundColor(Color("primaryColor"))
							.opacity(0.7)
					})
				})
			})
		}
		.accentColor(.white)
		.scrollDismissesKeyboard(.interactively)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(cashFund: CashFundViewModel(), cashRegister: CashRegisterViewModel())
	}
}
