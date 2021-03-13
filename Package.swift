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
        url: "https://github.com/mruiz723/MRCommons-iOS/releases/download/1.3.0/MRCommons.xcframework.zip",
        checksum: "42e1ef94d7ebc21b95db3c4c82301de508a118975887a09e30c90b9cec71d554"
      )
    ]
)
