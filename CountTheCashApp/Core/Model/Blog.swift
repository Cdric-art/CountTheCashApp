//
//  Blog.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 24/10/2023.
//

import Foundation

struct Blog: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
}

struct Source: Decodable {
    let id: String?
    let name: String
}
