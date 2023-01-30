//
//  CircleBackground.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 30/01/2023.
//

import SwiftUI

struct CircleBackground: View {
    var body: some View {
		Circle()
			.fill(
				AngularGradient(gradient: Gradient(colors: [.white, Color("primaryColor"), .white]), center: .bottomTrailing)
			)
			.frame(height: 500)
			.position(x: 150, y: 100)
			.ignoresSafeArea()
		Circle()
			.fill(
				AngularGradient(gradient: Gradient(colors: [.white, Color("primaryColor"), .white]), center: .bottomLeading)
			)
			.frame(height: 200)
			.position(x: 310, y: 400)
			.ignoresSafeArea()
		Circle()
			.fill(
				AngularGradient(gradient: Gradient(colors: [.white, Color("secondaryColor"), .white]), center: .topLeading)
			)
			.frame(height: 600)
			.position(x: 80, y: 800)
			.ignoresSafeArea()
    }
}

struct CircleBackground_Previews: PreviewProvider {
    static var previews: some View {
        CircleBackground()
    }
}
