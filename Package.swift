// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Hashira",
    dependencies: [
        .package(url: "https://github.com/shibapm/Komondor.git", from: "1.0.0")
    ]
)

#if canImport(PackageConfig)
import PackageConfig

let config = PackageConfiguration(
    [
        "komondor": [
            "post-checkout": ["./scripts/setup.sh", "./scripts/bootstrap.sh"],
            "post-merge": "./scripts/bootstrap.sh"
        ],
    ]
)
#endif