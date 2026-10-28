//
//  Endpoint.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation


struct Endpoint {
    let path: String
    var queryItems: [URLQueryItem] = []

    static let baseURL = "https://jsonplaceholder.typicode.com"
    var url: URL? {
        var components = URLComponents(string: Endpoint.baseURL)
        components?.path = path
        components?.queryItems = queryItems.isEmpty ? nil : queryItems
        return components?.url
    }
}

extension Endpoint {
    static let todoList = Endpoint(path: "/todos")
}
