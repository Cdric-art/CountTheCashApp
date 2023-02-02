//
//  TitleSecondaryView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 31/01/2023.
//

import SwiftUI

struct TitleSecondaryView: View {
	
	@State var title: String
	@State var color: Color = Color.black
	
    var body: some View {
        Text(title)
			.font(.largeTitle)
			.fontWeight(.heavy)
			.foregroundColor(color)
    }
}

