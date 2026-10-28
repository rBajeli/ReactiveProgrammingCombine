//
//  ToDoUseCaseImpl.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation
import Combine

struct ToDoUseCaseImpl: ToDoUseCase {
    let repo : ToDoRepository
    
    init(repo: ToDoRepository = ToDoRepositoryImpl()) {
        self.repo = repo
    }
    
    func getToDos(endpoint:Endpoint) -> AnyPublisher<[ToDoData], DomainError> {
        self.repo.getToDos(endpoint: endpoint).eraseToAnyPublisher()
    }
    
    
}
