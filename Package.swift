// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "swift-mastodon-api",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
    ],
    products: [
        .library(name: "MastodonAPI", targets: ["MastodonAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-http-types", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "MastodonAPI",
            dependencies: [.product(name: "HTTPTypesFoundation", package: "swift-http-types")],
            swiftSettings: [.enableExperimentalFeature("StrictConcurrency=complete")]
        ),
    ]
)
