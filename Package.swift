// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LogPrinter",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14)
    ],
    products: [
        .library(name: "LogPrinter", targets: ["LogPrinter"])
    ],
    targets: [
        .target(name: "LogPrinter")
    ]
)
