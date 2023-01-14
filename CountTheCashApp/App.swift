//
//  ContentView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 13/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationStack {
			
			TitleView(title: "Count The Cash", icon: "cashIcon")
			
			Spacer()
			
			VStack(spacing: 32) {
				NavigationLink(destination: CashFundView(), label: {
					VStack {
						Image(systemName: "dollarsign.circle.fill")
							.resizable()
							.scaledToFit()
							.foregroundColor(Color("secondaryColor"))
						Text("Cash Fund")
							.font(.subheadline)
							.foregroundColor(.black)
					}
					.frame(width: 120, height: 80)
					.padding()
					.background(Color.white)
					.cornerRadius(12)
					.shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.40) ,radius: 6)
				})
				
				
				NavigationLink(destination: CashRegisterView(), label: {
					VStack {
						Image(systemName: "dollarsign.circle.fill")
							.resizable()
							.scaledToFit()
							.foregroundColor(Color("primaryColor"))
						Text("Cash Register")
							.font(.subheadline)
							.foregroundColor(.black)
					}
					.frame(width: 120, height: 80)
					.padding()
					.background(Color.white)
					.cornerRadius(12)
					.shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.40), radius: 6)
				})
			}
			
			Spacer()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
