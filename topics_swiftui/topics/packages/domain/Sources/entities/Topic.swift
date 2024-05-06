//
//  Topic.swift
//
//
//  Created by Marco Sanna on 29.04.24.
//

import Foundation

/// Holds information on a topic, like a title and the date
/// the topic will be presented
public struct Topic: Identifiable {
    public let id: String
    public let title: String
    public let description: String
    public let date: Date

    /// Public identifier needed to make it instantiable from other packages
    public init(id: String, title: String, description: String, date: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
    }
}
