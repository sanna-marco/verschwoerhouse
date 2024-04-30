// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .iOS(.v17)
    ],
    products: [.library(name: "Domain", targets: ["Domain"])],
    targets: [
        .target(name: "Domain")
    ]
)
