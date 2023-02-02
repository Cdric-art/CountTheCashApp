//
//  NavigationLinkLabel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 31/01/2023.
//

import SwiftUI

struct NavigationLinkLabel: View {
	
	@State var imageName: String
	@State var color: String
	@State var title: String
	
	let shadow = Color(.sRGBLinear, white: 0.1, opacity: 0.1)
	
    var body: some View {
		VStack {
			Image(systemName: imageName)
				.resizable()
				.scaledToFit()
				.foregroundColor(Color(color))
			Text(title)
				.font(.subheadline)
				.foregroundColor(.black)
		}
		.frame(width: 120, height: 80)
		.padding()
		.background(.white)
		.cornerRadius(12)
		.shadow(color: shadow ,radius: 6)
    }
}

