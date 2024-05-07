//
//  PreviewTopicsRepositoryMock.swift
//  topics
//
//  Created by Marco Sanna on 30.04.24.
//

import Foundation
import Domain

/// Mocks the repository just for SwiftUI preview
class PreviewTopicsRepositoryMock: TopicsRepository {
    func all() async -> [Topic] {
        [
            Topic(id: "1", title: "first topic", description: "first topic description", date: Date()),
            Topic(id: "2", title: "second topic", description: "second topic description", date: Date().advanced(by: -20000))
        ]
    }
}
