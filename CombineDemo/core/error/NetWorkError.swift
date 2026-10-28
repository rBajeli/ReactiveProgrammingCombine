//
//  NetWorkError.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation

enum NetWorkError: Error {
    case invalidUrl
    case invalidResonse
    case badStatusCode(Int)
    case decodingError(Error)
    case wrongParameter
    case unauthroized
    case transportError(URLError)
    case unknown
}
