//
//  File.swift
//  
//
//  Created by Marco Sanna on 29.04.24.
//

import Foundation
import Domain

public struct TopicsRepositoryImpl: TopicsRepository {
    public init() {}
    public func observe() -> AsyncStream<[Topic]> {
        fatalError("Unimplemented")
    }
}
