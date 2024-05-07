//
//  TopicsListViewModel.swift
//  topics
//
//  Created by Marco Sanna on 30.04.24.
//

import SwiftUI
import Factory
import Domain

/// Manages the topics listview
@Observable class TopicsListViewModel {
    @ObservationIgnored
    @Injected(\.topicsRepository) var topicsRepository

    // MARK: - Observed elements

    var topics: [Topic] = []

    // MARK: - Interaction

    func getTopics() async {
        topics = await topicsRepository.all()
    }
}
