//
//  ContentView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 13/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
				.foregroundColor(Color("secondaryColor"))
            Text("Hello, world!")
				.font(.title2)
				.foregroundColor(Color("primaryColor"))
			Image("cashIcon")
				.resizable()
				.scaledToFit()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
