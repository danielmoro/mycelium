import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")
let bundleIDAttribute: Template.Attribute = .required("bundleID")

// consider:
// [{% for destination in {{destinations|split:","}} %}.{{ destination }}{% if not forloop.last %},{% endif %}{% endfor %}]

let template = Template(
	description: "Feature module template",
	attributes: [
		nameAttribute,
		bundleIDAttribute,
		.optional("destinations", default: "[.iPhone, .iPad]")
	],
	items: [
		//		.string(
//			path: "Project.swift",
//			contents: "My template contents of name \(nameAttribute)"
//		),
		.file(
			path: "App/Features/\(nameAttribute)/Project.swift",
			templatePath: "Structure/Project.stencil"
		),
		.file(
			path: "App/Features/\(nameAttribute)/Example/Sources/\(nameAttribute)ExampleApp.swift",
			templatePath: "Structure/Example/Sources/FeatureExampleApp.stencil"
		),
		.directory(
			path: "App/Features/\(nameAttribute)/Example",
			sourcePath: "Structure/Example/Resources"
		),
		.file(
			path: "App/Features/\(nameAttribute)/Interface/\(nameAttribute)Interface.swift",
			templatePath: "Structure/Interface/FeatureInterface.stencil"
		),
		.file(
			path: "App/Features/\(nameAttribute)/Core/Sources/\(nameAttribute)ViewModel.swift",
			templatePath: "Structure/Sources/FeatureDomain.stencil"
		),
		.directory(
			path: "App/Features/\(nameAttribute)/Core",
			sourcePath: "Structure/Resources"
		),
		.file(
			path: "App/Features/\(nameAttribute)/UI/Sources/\(nameAttribute)UIView.swift",
			templatePath: "Structure/Sources/UIView.stencil"
		),
		.directory(
			path: "App/Features/\(nameAttribute)/UI",
			sourcePath: "Structure/Resources"
		),
		.file(
			path: "App/Features/\(nameAttribute)/Testing/\(nameAttribute)Testing.swift",
			templatePath: "Structure/Testing/FeatureTesting.stencil"
		),
		.file(
			path: "App/Features/\(nameAttribute)/Tests/\(nameAttribute)Tests.swift",
			templatePath: "Structure/Tests/FeatureTests.stencil"
		)
	]
)
