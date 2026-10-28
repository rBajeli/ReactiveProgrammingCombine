//
//  HttpClientSignature.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation
import Combine

protocol HttpClientSignature {
    func get<T:Decodable>(endpoint:Endpoint, as type: T.Type) -> AnyPublisher<T, NetWorkError>
}
