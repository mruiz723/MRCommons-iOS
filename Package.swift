// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MRCommons-iOS",
    platforms: [
      .iOS(.v13)
    ],
    products: [
      .library(
        name: "MRCommons",
        targets: ["MRCommons"]),
    ],
    targets: [
      .binaryTarget(
        name: "MRCommons",
        url: "https://github.com/mruiz723/MRCommons-iOS/releases/download/1.1.0/MRCommons.xcframework.zip",
        checksum: "a6fa752af231c141904bd6a21d2fd42d6749a4646bea18082736a4ec8dc52b29"
      )
    ]
)
