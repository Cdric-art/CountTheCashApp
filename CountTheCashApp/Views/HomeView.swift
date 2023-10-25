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
            ZStack {
                
                BackgroundHomeView()
                
                VStack {
                    VStack(spacing: 46) {
                        Image("Image")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .padding(30)
                            .background(Color("OffWhiteTheme"))
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        
                        Text("Compte ta caisse")
                            .font(.system(size: 38))
                            .fontWeight(.black)
                            .frame(width: 300, height: 100)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 32)
                    
                    VStack(spacing: 4) {
                        Text(Date(), style: .date)
                            .font(.title3)
                        Text(Date(), style: .time)
                            .font(.callout)
                            .foregroundStyle(.blue)
                    }
                    
                    Spacer()
                    
                    if let blog = blog {
                        ScrollView(.horizontal) {
                            HStack(spacing: 0) {
                                ForEach(blog.articles, id: \.url) { article in
                                    HStack(alignment: .top) {
                                        VStack(alignment: .leading) {
                                            Text(article.title)
                                                .font(.caption2)
                                                .bold()
                                            
                                            HStack {
                                                AsyncImage(url: URL(string: article.urlToImage ?? "")) { img in
                                                    img.image?.resizable()
                                                        .scaledToFill()
                                                        .frame(width: 80)
                                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                                }
                                                Text(article.description)
                                                    .font(.system(size: 10))
                                            }
                                            
                                            if let url = URL(string: article.url) {
                                                Link("Voir plus", destination: url)
                                                    .tint(.blue)
                                                    .font(.system(size: 9))
                                                    .padding(.horizontal, 6)
                                            }
                                        }
                                        .padding(10)
                                        .neumorphicStyle()
                                    }
                                    .padding(16)
                                    .frame(width: 300, alignment: .topLeading)
                                }
                            }
                        }
                        .frame(width: 360, height: 200)
                        .scrollIndicators(.hidden)
                    } else {
                        VStack {
                            ProgressView()
                        }
                        .frame(height: 200)
                    }
                
                    Spacer()
                    
                    Text("Version : 2.0")
                        .font(.caption2)
                        .padding(.bottom)
                }
                .environment(\.locale, Locale(identifier: "fr"))
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
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
            .task {
                do {
                    self.blog = try await getBlog()
                } catch {
                    print("Error", error)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
