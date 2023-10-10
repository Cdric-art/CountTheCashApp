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
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Accueil", systemImage: "house.fill")
                }
            
            CashFundView(cashfund: cashFund)
                .tabItem {
                    Label("Fond de caisse", systemImage: "tray.fill")
                }
            
            CashRegisterView(cashRegister: cashRegister)
                .tabItem {
                    Label("Caisse", systemImage: "tray.and.arrow.up.fill")
                }
            
            LightCalculatorView(lightCalculator: lightCalculator)
                .tabItem {
                    Label("Calculette", systemImage: "plusminus")
                }
        }
        .tint(isDarkMode ? .white : .black)
        .keyboardType(.decimalPad)
        .scrollDismissesKeyboard(.interactively)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
