//
//  DomainMapper.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation

extension Array where Element == ToDoResponseDataDto {
    
    func toDomain() -> [ToDoData] {
        return self.map { obj in
            ToDoData(id: obj.id, name: obj.title, isCompleted: obj.completed, userId: obj.userId)
        }
    }
}
