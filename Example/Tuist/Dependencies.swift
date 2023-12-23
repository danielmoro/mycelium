import ProjectDescription

let dependencies = Dependencies(
	swiftPackageManager: .init(
		productTypes: [
			"ConcurrencyExtras": .framework,
			"ViewInspector": .framework,
			"swiftUINavigation": .framework
		]
	),
	platforms: [.macOS]
)
