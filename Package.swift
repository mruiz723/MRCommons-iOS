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
        checksum: "5625044361547bd2f590d0ff506eb2215dc9db607c07fef3a14258d826758d95"
      )
    ]
)
