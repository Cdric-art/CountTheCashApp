//
//  HomeView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 01/06/2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var effectBounce = 0
    
    var body: some View {
        let symbol = isDarkMode ? "sun.max.circle" : "moon.stars.circle"
        
        NavigationStack {
            ZStack {
                
                BackgroundHomeView()
                
                VStack {
                    VStack(spacing: 80) {
                        Image("Image")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .padding(30)
                            .background(Color("OffWhiteTheme"))
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        
                        Text("Compte ta caisse")
                            .font(.system(size: 38))
                            .fontWeight(.black)
                            .frame(maxWidth: 300)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 32)
                    
                    Spacer()
                    
                    VStack(spacing: 12) {
                        Text(Date(), style: .date)
                            .font(.title2)
                        Text(Date(), style: .time)
                            .font(.title3)
                    }
                    
                    Spacer()
                    
                    Text("Version : 2.0")
                        .font(.caption2)
                }
                .environment(\.locale, Locale(identifier: "fr"))
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        withAnimation {
                            isDarkMode.toggle()
                            effectBounce += 1
                        }
                    }, label: {
                        Image(systemName: symbol)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                    })
                    .tint(isDarkMode ? .white : .black)
                    .symbolEffect(.bounce.up.byLayer, value: effectBounce)
                })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
