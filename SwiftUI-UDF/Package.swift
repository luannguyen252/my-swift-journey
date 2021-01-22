// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUI-UDF",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SwiftUI-UDF",
            targets: ["SwiftUI-UDF"]
        )
    ],
    targets: [
        .target(
            name: "SwiftUI-UDF",
            dependencies: [],
            path: "Sources"
        ),
    ]
)
