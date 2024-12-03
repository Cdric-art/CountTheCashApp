//
//  ContentView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 13/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var cashFund = CashFund()
    @State private var cashRegister = CashRegister()
    @State private var lightCalculator = LightCalculator()
    
    @State private var selectedTag = 0
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: selectedTag == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTag == 0 ? .fill : .none)
                    Text("Accueil")
                }
                .tag(0)
                .onAppear { selectedTag = 0 }
            
            CashFundView(cashfund: cashFund)
                .tabItem {
                    Image(systemName: selectedTag == 1 ? "tray.fill" : "tray")
                        .environment(\.symbolVariants, selectedTag == 1 ? .fill : .none)
                    Text("Fond de caisse")
                }
                .tag(1)
                .onAppear { selectedTag = 1 }
            
            CashRegisterView(cashRegister: cashRegister)
                .tabItem {
                    Image(systemName: selectedTag == 2 ? "tray.and.arrow.up.fill" : "tray.and.arrow.up")
                        .environment(\.symbolVariants, selectedTag == 2 ? .fill : .none)
                    Text("Caisse")
                }
                .tag(2)
                .onAppear { selectedTag = 2 }
        }
        .tint(Color("TextColor"))
        .keyboardType(.decimalPad)
        .scrollDismissesKeyboard(.interactively)
    }
}

#Preview {
    ContentView()
}
