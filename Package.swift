// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "MastodonAPI",
    products: [
        .library(name: "MastodonAPI", targets: ["MastodonAPI"]),
    ],
    targets: [
        .target(name: "MastodonAPI", swiftSettings: [.enableExperimentalFeature("StrictConcurrency=complete")]),
    ]
)
