// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "swift-mastodon-api",
    products: [
        .library(name: "MastodonAPI", targets: ["MastodonAPI"]),
    ],
    targets: [
        .target(name: "MastodonAPI", swiftSettings: [.enableExperimentalFeature("StrictConcurrency=complete")]),
    ]
)
