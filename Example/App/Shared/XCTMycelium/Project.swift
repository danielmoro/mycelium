import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
	name: "XCTMycelium",
	targets: [
		Target(
			name: "XCTMycelium",
			destinations: [.mac],
			product: .framework,
			bundleId: "com.moroverse.Mycelium.XCTMycelium",
			sources: "Sources/**",
			scripts: [
				.pre(script: .lintScript(at: "$SRCROOT/Sources"), name: "Lint", basedOnDependencyAnalysis: false)
			],
			dependencies: [
				.xctest,
				.external(name: "CustomDump"),
				.external(name: "ConcurrencyExtras")
			]
		)
	]
)
