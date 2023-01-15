//
//  CountTheCashAppApp.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 13/01/2023.
//

import SwiftUI

@main
struct CountTheCashAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(cashFund: CashFund())
        }
    }
}
