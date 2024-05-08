//
//  TopicsCreateView.swift
//  topics
//
//  Created by Marco Sanna on 08.05.24.
//

import SwiftUI
import Flutter
import FlutterPluginRegistrant

/// Wraps the flutter viewcontroller into a swiftui view
struct TopicsCreateView: UIViewControllerRepresentable {
    @StateObject var flutterDependencies = FlutterTopicsCreateDependencies()

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
class FlutterTopicsCreateDependencies: ObservableObject {
    let flutterEngine = FlutterEngine(name: "topics create engine")
    init() {
        /// Runs at the specific route
        flutterEngine.run(withEntrypoint: nil, initialRoute: "/create")
        /// Connects plugins with iOS platform code to this app.
        GeneratedPluginRegistrant.register(with: self.flutterEngine);
    }
}
