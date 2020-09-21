//
//  Edge.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/11.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

public struct Edge<T>: Equatable where T: Hashable {
    public let from: Vertex<T>
    public let to: Vertex<T>
    
    public let weight: Double?
}

extension Edge: CustomStringConvertible {
    public var description: String {
        guard let unwrappedWeight = weight else {
            return "\(from.description) -> \(to.description)"
        }
        return "\(from.description) - (\(unwrappedWeight)) -> \(to.description)"
    }
}

extension Edge: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(from.description)
        hasher.combine(to.description)
        hasher.combine(weight)
    }
}

public func == <T>(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    return lhs.from == rhs.from &&
    lhs.to == rhs.to &&
    lhs.weight == rhs.weight
}
