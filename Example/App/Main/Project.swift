import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
	name: "Mycelium Grow",
	organizationName: "Moroverse", 
	packages: [
		.local(path: "../../../../mycelium")
	],
	settings: .projectSettings,
	targets: [
		Target(
			name: "Mycelium Grow",
			destinations: [.mac],
			product: .app,
			bundleId: "---",
			sources: "Sources/**",
			resources: "Resources/**",
			scripts: [
				.pre(script: .lintScript(at: "$SRCROOT/Sources"), name: "Lint", basedOnDependencyAnalysis: false)
			],
			dependencies: [
				.package(product: "mycelium"),
				.project(target: "UsersCore", path: .relativeToRoot("App/Features/Users")),
				.project(target: "UsersUI", path: .relativeToRoot("App/Features/Users"))
			],
			settings: .targetSettings
		),
		Target(
			name: "Mycelium Grow Tests",
			destinations: [.mac],
			product: .unitTests,
			bundleId: "com.moroverse.MyceliumGrowTests",
			sources: "Tests/**",
			dependencies: [
				.target(name: "Mycelium Grow")
			]
		)
	],
	schemes: Scheme.allSchemes(for: ["Mycelium Grow"], executable: "Mycelium Grow")
)
