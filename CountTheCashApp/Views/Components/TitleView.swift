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
	
    var body: some View {
		VStack {
			Text(title)
				.font(.system(size: 40))
				.fontWeight(.black)
				.frame(minWidth: 10, maxWidth: 250)
				.multilineTextAlignment(.center)
				.padding(.top, 32)
			
			Image(icon)
				.resizable()
				.scaledToFit()
				.cornerRadius(25)
				.frame(maxWidth: 150)
		}
    }
}
