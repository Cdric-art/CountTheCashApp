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
    @State private var blog: Blog?

    var body: some View {
        let symbol = isDarkMode ? "sun.max.circle" : "moon.stars.circle"

        NavigationStack {
            VStack {
                homeBackground()

                Text("Compte ta caisse")
                    .font(.system(size: 38))
                    .fontWeight(.black)
                    .foregroundColor(Color("TextColor"))
                    .frame(width: 300)
                    .multilineTextAlignment(.center)

                Spacer()
                    .frame(height: 12)

                VStack(spacing: 2) {
                    Text(Date(), style: .date)
                        .font(.title3)
                        .foregroundStyle(Color("TextColor"))
                    Text(Date(), style: .time)
                        .font(.callout)
                        .foregroundStyle(Color.primaryAccent)
                }
                .environment(\.locale, Locale(identifier: "fr"))

                Spacer()
                    .frame(height: 26)
                
                BlogView()

                Spacer()

            }
            .background(Color.base)
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(
                    placement: .topBarLeading,
                    content: {
                        Button(
                            action: {
                                withAnimation {
                                    isDarkMode.toggle()
                                    effectBounce += 1
                                }
                            },
                            label: {
                                Image(systemName: symbol)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24)
                            }
                        )
                        .tint(Color("TextColor"))
                        .symbolEffect(.bounce.up.byLayer, value: effectBounce)
                    })
            }

        }
    }

    private func homeBackground() -> some View {
        VStack {
            VStack(spacing: 22) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color("RedCat"))
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color("MaroonCat"))
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color("GreenCat"))
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color("YellowCat"))
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color("PinkCat"))
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color("PeachCat"))
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color("MauveCat"))
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color("Flamingo"))
                    .aspectRatio(contentMode: .fill)
            }
            .rotationEffect(.degrees(-32))
            .frame(width: 800, height: 360)
            .overlay {
                Image("Image")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(42)
                    .background(Color.secondaryBackground)
                    .clipShape(Circle())
                    .shadow(
                        color: Color.black.opacity(0.1),
                        radius: 10,
                        x: 10,
                        y: 10
                    )
                    .shadow(
                        color: Color.white.opacity(0.7),
                        radius: 10,
                        x: -5,
                        y: -5)
            }
        }
    }
}

#Preview {
    HomeView()
}
