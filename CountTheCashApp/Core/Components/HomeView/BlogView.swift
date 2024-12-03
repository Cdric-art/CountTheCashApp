//
//  BlogView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 03/12/2024.
//

import SwiftUI

struct BlogView: View {
    @State private var blog: Blog?
    var body: some View {
        VStack(alignment: .leading) {

            if let blog = blog {

                Text("Actualités :")
                    .foregroundStyle(Color("TextColor"))
                    .font(.callout)
                    .underline()

                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(blog.articles, id: \.url) { article in
                            articleCard(article)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)

            } else {
                VStack {
                    ProgressView()
                }
                .frame(height: 200)
            }
        }
        .frame(width: 360, height: 200)
        .task {
            do {
                blog = try await getBlog()
            } catch {
                print(error)
            }
        }
    }

    private func articleCard(_ article: Article) -> some View {

        VStack(alignment: .leading) {
            Text(article.title)
                .font(.subheadline)
                .foregroundStyle(Color("TextColor"))
                .bold()

            HStack {
                AsyncImage(url: URL(string: article.urlToImage ?? "")) {
                    img in
                    img.image?.resizable()
                        .scaledToFill()
                        .frame(width: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                Text(article.description)
                    .font(.caption)
            }
            .foregroundStyle(Color("TextColor"))

            if let url = URL(string: article.url) {
                Link("Voir plus", destination: url)
                    .tint(.blue)
                    .font(.caption2)
                    .padding(.horizontal, 6)
            }
        }
        .padding()
        .frame(maxWidth: 360)
        .background(Color.secondaryBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    BlogView()
}
