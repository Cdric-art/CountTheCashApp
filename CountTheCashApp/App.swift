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
            Group {
                HomeView()
                    .tabItem {
                        Label("Accueil", systemImage: "house.fill")
                    }
                
                NavigationStack {
                    CashFundView()
                        .navigationTitle("Fond")
                }
                .tabItem {
                    Label("Fond de caisse", systemImage: "tray.fill")
                }
                
                NavigationStack {
                    CashRegisterView()
                        .navigationTitle("Caisse")
                }
                .tabItem {
                    Label("Caisse", systemImage: "tray.and.arrow.up.fill")
                }
                
                NavigationStack {
                    LightCalculatorView()
                        .navigationTitle("Calculette")
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Label("Calculette", systemImage: "plusminus")
                }
            }
            .toolbarBackground(Color.offWhite, for: .tabBar)
		}
		.accentColor(.black)
        .keyboardType(.decimalPad)
        .scrollDismissesKeyboard(.interactively)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
