//
//  HomeView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 01/06/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
		VStack {
			
			Spacer()
			
            VStack {
                Text("Compte ta caisse")
                    .font(.system(size: 38))
                    .fontWeight(.black)
                    .frame(maxWidth: 300)
                    .multilineTextAlignment(.center)
                
                Image("Image")
                    .resizable()
                    .scaledToFit()
            }
			
			Spacer()
			
			VStack(spacing: 12) {
				Text(Date(), style: .date)
					.font(.title2)
				Text(Date(), style: .time)
					.font(.title3)
			}
			
			Spacer()
		}
		.environment(\.locale, Locale(identifier: "fr"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
