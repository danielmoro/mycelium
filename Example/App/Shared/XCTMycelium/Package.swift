// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "XCTMycelium",
	platforms: [
		.iOS(.v13),
		.macOS(.v11)
	],
	products: [
		.library(
			name: "XCTMycelium",
			targets: ["XCTMycelium"]
		)
	],
	dependencies: [
		.package(url: "https://github.com/pointfreeco/swift-custom-dump.git", from: "1.1.2"),
		.package(url: "https://github.com/pointfreeco/swift-concurrency-extras.git", from: "1.1.0")
	],
	targets: [
		.target(
			name: "XCTMycelium",
			dependencies: [
				.product(name: "CustomDump", package: "swift-custom-dump"),
				.product(name: "ConcurrencyExtras", package: "swift-concurrency-extras")
			],
			swiftSettings: [.enableExperimentalFeature("StrictConcurrency=complete")]
		)
	]
)
