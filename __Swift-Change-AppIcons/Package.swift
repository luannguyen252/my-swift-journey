// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "AppIcons",
    platforms: [
        .iOS("8.0")
    ],
    products: [
        .library(
            name: "AppIcons",
            targets: ["AppIcons"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/rwbutler/FlexibleRowHeightGridLayout",
            from: "1.3.1"
        )
    ],
    targets: [
        .target(
            name: "AppIcons",
            dependencies: ["FlexibleRowHeightGridLayout"],
            path: "AppIcons/Classes"
        )
    ]
)
