	//
	//  ContentView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 13/01/2023.
	//

import SwiftUI

struct ContentView: View {
	@StateObject var cashFund = CashFundViewModel()
	@StateObject var cashRegister = CashRegisterViewModel()
	
	var body: some View {
		TabView {
			HomeView()
				.tabItem {
					Label("Accueil", systemImage: "house.fill")
				}
			CashFundView(cashFund: cashFund)
				.tabItem {
					Label("Fond de caisse", systemImage: "tray.fill")
				}
			CashRegisterView(cashRegisterData: cashRegister)
				.tabItem {
					Label("Caisse", systemImage: "tray.and.arrow.up.fill")
				}
		}
		.accentColor(.black)
		.scrollDismissesKeyboard(.interactively)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(cashFund: CashFundViewModel(), cashRegister: CashRegisterViewModel())
	}
}
