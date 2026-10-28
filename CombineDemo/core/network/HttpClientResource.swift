//
//  HttpClientResource.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation
import Combine

final class HttpClientResource : HttpClientSignature {
    func get<T>(endpoint: Endpoint, as type: T.Type) -> AnyPublisher<T, NetWorkError> where T : Decodable {
        
        if let url = endpoint.url {
            return URLSession.shared.dataTaskPublisher(for: url)
                .mapError{NetWorkError.transportError($0)}
                    .tryMap { output -> Data in
                        if let response = output.response as? HTTPURLResponse {
                            if 200..<300 ~= response.statusCode {
                                let data = output.data
                                return data
                            }else {
                                throw NetWorkError.badStatusCode(response.statusCode)

                            }
                        }else {
                            throw NetWorkError.invalidResonse
                        }
                    }
                    .decode(type: T.self, decoder: JSONDecoder.init())
                    .mapError({ error -> NetWorkError in
                        if let nError = error as? NetWorkError { return nError}
                        return .decodingError(error)
                    })
                    .eraseToAnyPublisher()
        }else {
           return  Fail<T, NetWorkError>(error: .invalidUrl).eraseToAnyPublisher()
        }
    }
    
    
    
}
