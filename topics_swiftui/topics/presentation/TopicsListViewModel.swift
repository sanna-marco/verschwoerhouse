//
//  TopicsListViewModel.swift
//  topics
//
//  Created by Marco Sanna on 30.04.24.
//

import SwiftUI
import Factory
import Domain

@Observable class TopicsListViewModel {
    @ObservationIgnored
    @Injected(\.topicsRepository) var topicsRepository

    // MARK: - Observed elements

    var topics: [Topic] = []

    // MARK: - Interaction

    func observe() async {
        for await topics in topicsRepository.observe() {
            self.topics = topics
        }
    }
}
