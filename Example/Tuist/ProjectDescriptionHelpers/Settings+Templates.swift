import Foundation
import ProjectDescription

public extension ProjectDescription.Settings {
	static var projectSettings: Self {
		.settings(
			configurations: BuildEnvironment.allCases.map(\.projectConfiguration)
		)
	}

	static var targetSettings: Self {
		.settings(
			configurations: BuildEnvironment.allCases.map(\.targetConfiguration)
		)
	}
}
