//
//  ToDoRepositoryImpl.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation
import Combine

struct ToDoRepositoryImpl : ToDoRepository {
    var client:HttpClientSignature = HttpClientResource()
    
    init(client: HttpClientSignature = HttpClientResource()) {
        self.client = client
    }
    func getToDos(endpoint: Endpoint) -> AnyPublisher<[ToDoData], DomainError> {
        return self.client.get(endpoint: endpoint, as: [ToDoResponseDataDto].self)
            .map({ data in
                data.toDomain()
            })
            .mapError({ error in
                DomainError.unauthorized
            })
            .eraseToAnyPublisher()
    }
    
    
}
