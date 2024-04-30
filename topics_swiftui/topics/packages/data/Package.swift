// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "Data", targets: ["Data"])
    ],
    dependencies: [
        .package(name: "Domain", path: "../domain")
    ],
    targets: [
        .target(
            name: "Data",
            dependencies: [
                .product(name: "Domain", package: "Domain")
            ]
        )
    ]
)
