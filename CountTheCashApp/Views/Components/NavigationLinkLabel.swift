//
//  NavigationLinkLabel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 31/01/2023.
//

import SwiftUI

struct NavigationLinkLabel: View {
	
	@State var imageName: String
	@State var title: String
	
    var body: some View {
		VStack {
			Image(systemName: imageName)
				.resizable()
				.scaledToFit()
				.frame(height: 40)
				.opacity(0.7)
			Text(title)
				.font(.subheadline)
		}
		.frame(width: 140, height: 80)
		.padding()
		.foregroundColor(.black)
		.cornerRadius(24)
		.overlay(content: {
			RoundedRectangle(cornerRadius: 10)
				.stroke(Color.black.opacity(0.1), lineWidth: 1)
				.shadow(color: .black.opacity(0.2), radius: 3, x: 2, y: 4)
		})
    }
}

