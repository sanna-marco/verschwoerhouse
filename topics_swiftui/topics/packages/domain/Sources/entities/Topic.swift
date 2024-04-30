//
//  Topic.swift
//
//
//  Created by Marco Sanna on 29.04.24.
//

import Foundation

public struct Topic: Identifiable {
    public let id: String
    public let title: String
    public let description: String
    public let date: Date

    public init(id: String, title: String, description: String, date: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
    }
}
