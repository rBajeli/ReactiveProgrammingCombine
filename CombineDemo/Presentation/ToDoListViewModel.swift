//
//  ToDoListViewModel.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation
import Combine
import Observation

@MainActor @Observable
class ToDoListViewModel {
    var data: [ToDoData] = []
    var state: ToDoListState = .ideal
    @ObservationIgnored let useCase: ToDoUseCase
    var anyCancellable: AnyCancellable?
    
    init(data: [ToDoData] = [], state: ToDoListState = .ideal, useCase: ToDoUseCase) {
        self.data = data
        self.state = state
        self.useCase = useCase
    }
    
    func handleAction(action:ToDoListAction) {
        
        if action == .load || action == .refresh {
            loadData()
        }
    }
    
    func loadData() {
        anyCancellable =   self.useCase.getToDos(endpoint: .todoList)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.state = .eror(error)
                }
            } receiveValue: { data in
                if data.isEmpty {
                    self.state = .empty
                }else {
                    self.state = .loaded(data)
                }
            }
    }
}
