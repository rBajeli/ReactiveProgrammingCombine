//
//  DomainError.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import Foundation

enum DomainError: Error {
    case invalidData
    case networkError
    case unauthorized
    case unknown
}
