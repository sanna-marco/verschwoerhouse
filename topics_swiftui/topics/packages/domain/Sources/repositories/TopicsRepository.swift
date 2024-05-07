//
//  TopicsRepository.swift
//
//
//  Created by Marco Sanna on 29.04.24.
//

import Foundation

/// Manages topics
public protocol TopicsRepository {
    /// Retrieves topics from local storage
    func all() async -> [Topic]
}
