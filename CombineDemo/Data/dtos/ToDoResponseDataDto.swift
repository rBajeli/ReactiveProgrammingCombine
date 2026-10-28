//
//  ToDoResponseDataDto.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation

struct ToDoResponseDataDto:Decodable {
    let id: Int
    let title: String
    let completed: Bool
    let userId: Int
}
