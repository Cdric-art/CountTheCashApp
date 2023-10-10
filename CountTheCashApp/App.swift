	//
	//  ContentView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 13/01/2023.
	//

import SwiftUI

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
	var body: some View {
		TabView {
            NavigationStack {
                HomeView()
            }
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
        .tint(isDarkMode ? .white : .black)
        .keyboardType(.decimalPad)
        .scrollDismissesKeyboard(.interactively)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(action: {
                    hideKeyboard()
                }, label: {
                    Image(systemName: "arrow.down.circle")
                })
            }
        }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
