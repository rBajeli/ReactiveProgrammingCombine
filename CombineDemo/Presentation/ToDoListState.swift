//
//  ToDoListState.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation

enum ToDoListState {
    case ideal
    case loading
    case loaded([ToDoData])
    case empty
    case eror(DomainError)
}

enum ToDoListAction {
    case refresh
    case load
}
