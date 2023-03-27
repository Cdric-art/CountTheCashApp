//
//  TitleView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 14/01/2023.
//

import SwiftUI

struct TitleView: View {
	
	@State var title: String
	@State var icon: String
	@State var color: Color
	
    var body: some View {
		VStack {
			Text(title)
				.font(.system(size: 38))
				.fontWeight(.black)
				.frame(maxWidth: 300)
				.multilineTextAlignment(.center)
			
			Image(icon)
				.resizable()
				.scaledToFit()
				.cornerRadius(110)
				.frame(width: 110)
				.shadow(color: Color(.sRGBLinear, white: 0.1, opacity: 0.1) ,radius: 1)
		}
		.foregroundColor(color)
    }
}

struct TitleView_Previews: PreviewProvider {
	static var previews: some View {
		TitleView(title: "Compte ta caisse", icon: "cashIcon", color: .black)
	}
}
