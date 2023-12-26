// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "EventTrackerLib",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "EventTrackerLib",
            targets: ["EventTrackerLib"])
    ],
    targets: [
        .target(
            name: "EventTrackerLib",
            path: "EventTrackerLib"),
    ]
)
