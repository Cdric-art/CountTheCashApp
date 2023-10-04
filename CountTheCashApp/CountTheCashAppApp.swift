//
//  CountTheCashAppApp.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 13/01/2023.
//

import SwiftUI

@main
struct CountTheCashAppApp: App {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
		}
	}
}

struct CountTheCashAppApp_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
