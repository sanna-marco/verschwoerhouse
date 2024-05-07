//
//  TopicsDetailView.swift
//  topics
//
//  Created by Marco Sanna on 07.05.24.
//

import SwiftUI
import Flutter
import FlutterPluginRegistrant

/// Wraps the flutter viewcontroller into a swiftui view
struct TopicsDetailView: UIViewControllerRepresentable {
    let topicId: String
    @StateObject var flutterDependencies: FlutterTopicsDependencies

    /// Initialized with a topic id which initially came from flutter
    init(topicId: String) {
        self.topicId = topicId
        self._flutterDependencies = StateObject(wrappedValue: FlutterTopicsDependencies(withTopicId: topicId))
    }

    /// Creates the view from a view controller
    func makeUIViewController(context: Context) -> some UIViewController {
        /// Create a FlutterViewController from a pre-warmed FlutterEngine
        let flutterViewController = FlutterViewController(
            engine: flutterDependencies.flutterEngine,
            nibName: nil,
            bundle: nil
        )
        return flutterViewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

/// Instantiates the engine with a given topic id
class FlutterTopicsDependencies: ObservableObject {
    let flutterEngine = FlutterEngine(name: "topics details engine")
    init(withTopicId topicId: String) {
        /// Runs at the specific route
        flutterEngine.run(withEntrypoint: nil, initialRoute: "/detailsOnly/\(topicId)")
        /// Connects plugins with iOS platform code to this app.
        GeneratedPluginRegistrant.register(with: self.flutterEngine);
    }
}
