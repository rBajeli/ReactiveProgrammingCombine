//
//  ToDoList.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation

struct ToDoData : Identifiable,Equatable {
    let id: Int
    let name: String
    let isCompleted: Bool
    let userId: Int
}
