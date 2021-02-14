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
        url: "https://github.com/mruiz723/MRCommons-iOS/releases/download/1.2.0/MRCommons.xcframework.zip",
        checksum: "64bed3f54b6062bcd672fcea3a12c2e9d47e03098778e055c8424c6c95df7599"
      )
    ]
)
