//
//  TopicsRepository.swift
//
//
//  Created by Marco Sanna on 29.04.24.
//

import Foundation

public protocol TopicsRepository {
    func observe() -> AsyncStream<[Topic]>
}
