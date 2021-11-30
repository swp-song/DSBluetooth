// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DSBluetooth", platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "DSBluetooth",
            targets: ["DSBluetooth"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swp-song/DSBase.git", .upToNextMajor(from: "3.0.0")),
    ],
    targets: [
        .target(
            name: "DSBluetooth",
            dependencies: ["DSBase"],
            path: "Sources"
        )
    ],
    
    swiftLanguageVersions: [.v5]
)
