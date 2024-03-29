//
//  TitleView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 14/01/2023.
//

import SwiftUI

struct TitleView: View {
	
	@State var title: String
	
    var body: some View {
		VStack {
			Text(title)
				.font(.system(size: 38))
				.fontWeight(.black)
				.frame(maxWidth: 300)
				.multilineTextAlignment(.center)
			
			Image("Image")
				.resizable()
				.scaledToFit()
				.cornerRadius(25)
				.frame(width: 125)
				.shadow(color: Color(.sRGBLinear, white: 0.01, opacity: 0.3) ,radius: 6)
		}
    }
}

struct TitleView_Previews: PreviewProvider {
	static var previews: some View {
		TitleView(title: "Compte ta caisse")
	}
}
