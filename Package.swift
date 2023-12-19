// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "MastodonAPI",
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
