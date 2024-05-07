//
//  File.swift
//  
//
//  Created by Marco Sanna on 29.04.24.
//

import Foundation
import Domain
import Flutter

/// Implements the topics repository on top of swift data
public class TopicsRepositoryImpl: TopicsRepository {
    private var flutterTopicsRepository: FlutterTopicsRepository?
    private let formatter = ISO8601DateFormatter()

    /// Public initialization to make this available to other packages,
    /// and formatting modified
    public init() {
        formatter.formatOptions.insert(.withFractionalSeconds)
        formatter.formatOptions.insert(.withInternetDateTime)
    }

    /// Lazy setting of the messenger because it is available after instantiation
    public func set(messenger: FlutterBinaryMessenger) {
        self.flutterTopicsRepository = FlutterTopicsRepository(binaryMessenger: messenger)
    }

    /// Returns all topics from the flutter app
    @MainActor
    public func all() async -> [Topic] {
        guard let flutterTopicsRepository else {
            print("No messenger available")
            return []
        }
        return await withUnsafeContinuation { continuation in
            flutterTopicsRepository.getTopics { [self] result in
                switch result {
                case .success(let pigeonTopics):
                    let topics = pigeonTopics.compactMap { pigeonTopic -> Topic? in
                        guard let date = self.formatter.date(from: "\(pigeonTopic.dateTime)Z") else {
                            return nil
                        }
                        return Topic(
                            id: "\(pigeonTopic.id)",
                            title: pigeonTopic.title,
                            description: pigeonTopic.description,
                            date: date
                        )
                    }
                    continuation.resume(returning: topics)

                case .failure(let error):
                    print("failed to fetch topics: \(error)")
                    continuation.resume(returning: [])
                }
            }
        }
    }
}
