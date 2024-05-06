//
//  File.swift
//  
//
//  Created by Marco Sanna on 29.04.24.
//

import Foundation
import Domain

/// Implements the topics repository on top of swift data
public struct TopicsRepositoryImpl: TopicsRepository {

    /// Public initialization to make this available to other packages
    public init() {}

    public func observe() -> AsyncStream<[Topic]> {
        fatalError("Unimplemented")
    }
}
