import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
	name: "Users",
	settings: .projectSettings,
	targets: [
		Target(
			name: "UsersInterface",
			destinations: [.mac],
			product: .framework,
			bundleId: "com.moroverse.MyceliumGrow.UsersInterface",
			sources: "Interface/**",
			scripts: [
				.pre(script: .lintScript(at: "$SRCROOT/Interface"), name: "Lint", basedOnDependencyAnalysis: false)
			]
		),
		Target(
			name: "UsersCore",
			destinations: [.mac],
			product: .framework,
			bundleId: "com.moroverse.MyceliumGrow.UsersCore",
			sources: "Core/Sources/**",
			resources: "Core/Resources/**",
			scripts: [
				.pre(script: .lintScript(at: "$SRCROOT/Core/Sources"), name: "Lint", basedOnDependencyAnalysis: false)
			],
			dependencies: [
				.target(name: "UsersInterface"),
				.external(name: "CasePaths")
			]
		),
		Target(
			name: "UsersTesting",
			destinations: [.mac],
			product: .framework,
			bundleId: "com.moroverse.MyceliumGrow.UsersTesting",
			sources: "Testing/**",
			scripts: [
				.pre(script: .lintScript(at: "$SRCROOT/Testing"), name: "Lint", basedOnDependencyAnalysis: false)
			],
			dependencies: [
				.target(name: "UsersInterface")
			]
		),
		Target(
			name: "UsersUI",
			destinations: [.mac],
			product: .framework,
			bundleId: "com.moroverse.MyceliumGrow.UsersUI",
			sources: "UI/Sources/**",
			resources: "UI/Resources/**",
			scripts: [
				.pre(script: .lintScript(at: "$SRCROOT/UI/Sources"), name: "Lint", basedOnDependencyAnalysis: false)
			],
			dependencies: [
				.target(name: "UsersCore"),
				.target(name: "UsersTesting"),
				.external(name: "SwiftUINavigation")
			]
		),
		Target(
			name: "UsersTests",
			destinations: [.mac],
			product: .unitTests,
			bundleId: "com.moroverse.MyceliumGrow.UsersTests",
			sources: "Tests/**",
			scripts: [
				.pre(script: .lintScript(at: "$SRCROOT/Tests"), name: "Lint", basedOnDependencyAnalysis: false)
			],
			dependencies: [
				.target(name: "UsersCore"),
				.target(name: "UsersTesting"),
				.target(name: "UsersUI"),
				.external(name: "ConcurrencyExtras"),
				.external(name: "ViewInspector")
			]
		),
		Target(
			name: "UsersExample",
			destinations: [.mac],
			product: .app,
			bundleId: "com.moroverse.MyceliumGrow.UsersExample",
			sources: "Example/Sources/**",
			resources: "Example/Resources/**",
			scripts: [
				.pre(script: .lintScript(at: "$SRCROOT/Example/Sources"), name: "Lint")
			],
			dependencies: [
				.target(name: "UsersCore"),
				.target(name: "UsersUI")
			]
		)
	]
)
