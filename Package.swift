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
        url: "https://github.com/mruiz723/MRCommons-iOS/releases/download/1.0.1/MRCommons.xcframework.zip",
        checksum: "724635f4b74de3dd3fd5574daca7f83c036a2a9e34169ae36720e9825aa7c31a"
      )
    ]
)
