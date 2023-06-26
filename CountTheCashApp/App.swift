	//
	//  ContentView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 13/01/2023.
	//

import SwiftUI

struct ContentView: View {
	var body: some View {
		TabView {
			HomeView()
				.tabItem {
					Label("Accueil", systemImage: "house.fill")
				}
			CashFundView()
				.tabItem {
					Label("Fond de caisse", systemImage: "tray.fill")
				}
			CashRegisterView()
				.tabItem {
					Label("Caisse", systemImage: "tray.and.arrow.up.fill")
				}
		}
		.accentColor(.black)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
