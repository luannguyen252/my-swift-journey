// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LemonadeStandLocations",
  products: [
    .library(
      name: "LemonadeStandLocations",
      targets: ["LemonadeStandLocations"])
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "LemonadeStandLocations",
      dependencies: [])
  ]
)
