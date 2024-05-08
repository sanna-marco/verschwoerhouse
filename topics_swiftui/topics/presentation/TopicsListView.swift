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
    @State var showCreateView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewmodel.topics) { topic in
                    NavigationLink {
                        TopicsDetailView(topicId: topic.id)
                    } label: {
                        HStack(alignment: .top) {
                            Text(topic.title)
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text(topic.date.formatted())
                                    .foregroundStyle(.secondary)
                                Text(topic.description)
                                    .multilineTextAlignment(.trailing)
                            }
                            .font(.caption)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showCreateView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .task {
                await viewmodel.getTopics()
            }
            .refreshable {
                await viewmodel.getTopics()
            }
            .sheet(isPresented: $showCreateView, onDismiss: {
                Task {
                    await viewmodel.getTopics()
                }
            }) {
                TopicsCreateView()
            }
            .navigationTitle("Topics")
        }
    }
}

#Preview {
    TopicsListView()
}
