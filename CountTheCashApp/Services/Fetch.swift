//
//  Fetch.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 24/10/2023.
//

import Foundation

func getBlog() async throws -> Blog? {
    guard let url = URL(string: "https://newsapi.org/v2/everything?q=(hôtellerie OR restaurant)&searchIn=title&pageSize=8&sortBy=publishedAt&domains=francetvinfo.fr,ouest-france.fr,marianne.net,lesechos.fr,konbini.com,leparisien.fr&apiKey=0c0a8b23304e4447ac47e0603e073e78") else {
        print("Missing URL")
        return nil
    }
    let urlRequest = URLRequest(url: url)
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    
    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        print("Error while fetching data")
        return nil
    }
    
    let decodedBlog = try JSONDecoder().decode(Blog.self, from: data)
    
    return decodedBlog
}
