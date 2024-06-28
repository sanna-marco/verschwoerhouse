//
//  topicsApp.swift
//  topics
//
//  Created by Marco Sanna on 29.04.24.
//

import SwiftUI
import SwiftData
import Flutter
import FlutterPluginRegistrant
import Factory
import Data

class FlutterDependencies: ObservableObject {
    let flutterEngine = FlutterEngine(name: "topics engine")
    init() {
        /// Runs the default Dart entrypoint with a default Flutter route.
        flutterEngine.run()
        /// Connects plugins with iOS platform code to this app.
        GeneratedPluginRegistrant.register(with: self.flutterEngine)
    }
}

@main
struct topicsApp: App {
    /// Injects flutter related tasks to the swiftui app
    @StateObject var flutterDependencies = FlutterDependencies()

    var body: some Scene {
        WindowGroup {
            TopicsListView()
                .environmentObject(flutterDependencies)
                .onAppear {
                    if let repo = Container.shared.topicsRepository() as? TopicsRepositoryImpl {
                        repo.set(messenger: flutterDependencies.flutterEngine.binaryMessenger)
                    }
                }
        }
    }
}
