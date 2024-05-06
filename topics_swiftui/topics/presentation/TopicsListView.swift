//
//  ContentView.swift
//  topics
//
//  Created by Marco Sanna on 29.04.24.
//

import SwiftUI
import SwiftData
import Data
import Factory

/// Shows a list of topics, moves to details on click.
/// Details are served from flutter.
struct TopicsListView: View {
    var viewmodel = TopicsListViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewmodel.topics) { topic in
                    HStack {
                        Text(topic.title)
                        Text(topic.description)
                    }
                }
            }
            .task {
                await viewmodel.observe()
            }
            .navigationTitle("Topics")
        }
    }
}

#Preview {
    let _ = Container.shared.topicsRepository.register { PreviewTopicsRepositoryMock() }
    return TopicsListView()
}
