//
//  TopicsRepository.swift
//
//
//  Created by Marco Sanna on 29.04.24.
//

import Foundation

/// Manages topics
public protocol TopicsRepository {
    /// Observes the local database
    func observe() -> AsyncStream<[Topic]>
}
