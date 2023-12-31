// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Navigation",
    defaultLocalization: "en",
    platforms: [.macOS(.v14), .iOS(.v17)],
    products: [
        .library(
            name: "Navigation",
            targets: ["Navigation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Kamaalio/KamaalSwift.git", .upToNextMajor(from: "1.2.0")),
        .package(path: "../Features"),
    ],
    targets: [
        .target(
            name: "Navigation",
            dependencies: [
                .product(name: "KamaalNavigation", package: "KamaalSwift"),
                .product(name: "KamaalUI", package: "KamaalSwift"),
                .product(name: "LinkList", package: "Features")
            ],
            resources: [
                .process("Internal/Resources"),
            ]),
        .testTarget(
            name: "NavigationTests",
            dependencies: ["Navigation"]),
    ]
)
