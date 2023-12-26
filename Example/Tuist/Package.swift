// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "Packages",
	dependencies: [
		.package(url: "https://github.com/pointfreeco/swift-concurrency-extras.git", from: "1.1.0"),
		.package(url: "https://github.com/nalexn/ViewInspector.git", from: "0.9.9"),
		.package(url: "https://github.com/pointfreeco/swiftui-navigation.git", from: "1.2.0"),
		.package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay.git", from: "1.0.2"),
		.package(url: "https://github.com/pointfreeco/swift-clocks.git", from: "1.0.2")
	]
)
