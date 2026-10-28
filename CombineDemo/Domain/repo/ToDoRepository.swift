//
//  ToDoRepository.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation
import Combine

protocol ToDoRepository {
    func getToDos(endpoint: Endpoint) -> AnyPublisher<[ToDoData], DomainError>
}
