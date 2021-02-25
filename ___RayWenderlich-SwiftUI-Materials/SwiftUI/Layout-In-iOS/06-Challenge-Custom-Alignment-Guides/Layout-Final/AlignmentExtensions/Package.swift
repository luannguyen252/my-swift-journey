// swift-tools-version:5.1

import PackageDescription

let name = "AlignmentExtensions"

let package = Package(
  name: name,
  platforms: [.iOS(.v13), .tvOS(.v13), .macOS(.v10_15)],
  products: [
    .library(name: name, targets: [name]),
  ],
  targets: [
    .target(name: name)
  ]
)
