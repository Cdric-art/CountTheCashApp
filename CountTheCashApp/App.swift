	//
	//  ContentView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 13/01/2023.
	//

import SwiftUI

struct ContentView: View {
	@Environment(\.colorScheme) var colorScheme
	
	@ObservedObject var cashFund: CashFund
	@ObservedObject var cashRegister: CashRegister
	
	var body: some View {
		
		let shadowTheme = colorScheme == .dark ? Color(.sRGBLinear, white: 3, opacity: 0.40) : Color(.sRGBLinear, white: 0.1, opacity: 0.10)
		
		NavigationStack {
			
			TitleView(title: "Compte ta caisse", icon: "cashIcon")
			
			Spacer()
			
			VStack(spacing: 32) {
				NavigationLink(destination: CashFundView(cashFund: cashFund), label: {
					VStack {
						Image(systemName: "dollarsign.arrow.circlepath")
							.resizable()
							.scaledToFit()
							.foregroundColor(Color("secondaryColor"))
						Text("Fond de caisse")
							.font(.subheadline)
							.foregroundColor(.black)
					}
					.frame(width: 120, height: 80)
					.padding()
					.background(.white)
					.cornerRadius(12)
					.shadow(color: shadowTheme ,radius: 6)
				})
				
				NavigationLink(destination: CashRegisterView(cashRegister: cashRegister), label: {
					VStack {
						Image(systemName: "dollarsign.square.fill")
							.resizable()
							.scaledToFit()
							.foregroundColor(Color("primaryColor"))
						Text("Caisse")
							.font(.subheadline)
							.foregroundColor(.black)
					}
					.frame(width: 120, height: 80)
					.padding()
					.background(.white)
					.cornerRadius(12)
					.shadow(color: shadowTheme, radius: 6)
				})
			}
			
			Spacer()
			
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(cashFund: CashFund(), cashRegister: CashRegister())
	}
}
