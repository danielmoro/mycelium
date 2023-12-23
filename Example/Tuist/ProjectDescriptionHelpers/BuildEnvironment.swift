import Foundation
import ProjectDescription

public enum BuildEnvironment: String, CaseIterable {
	case debug, release, beta

	public var name: String { rawValue.firstUppercased }

	public var configurationName: ConfigurationName {
		ConfigurationName(stringLiteral: name)
	}

	public var projectConfigPath: Path {
		/// String literal based paths are `.relativeToManifest` by default. So, if you have separate XCConfigurations per
		/// project then you can only return `"path_relative_to_project.xcconfig"` i.e., `App/Configurations/Target.xcconfig`
		/// However, it is better to use all paths as `.relativeToRoot` for explicitness
		.relativeToRoot("App/ConfigurationFiles/\(name).xcconfig")
	}

	public var targetConfigPath: Path {
		.relativeToRoot("App/ConfigurationFiles/Target.\(name).xcconfig")
	}

	public var targetConfiguration: Configuration {
		let elderBrainURL = Environment.elderBrainURL.getString(default: "---")
		let mindLinkKey = Environment.mindLinkKey.getString(default: "---")

		let secrets: ProjectDescription.SettingsDictionary = [
			"ELDER_BRAIN_URL":.string(elderBrainURL),
			"MIND_LINK_KEY": .string(mindLinkKey)
		]
		
		switch self {
		case .debug:
			return.debug(name: configurationName, settings: secrets, xcconfig: targetConfigPath)
		case .release:
			return .release(name: configurationName, settings: secrets, xcconfig: targetConfigPath)
		case .beta:
			return .release(name: configurationName, settings: secrets, xcconfig: targetConfigPath)
		}
	}

	public var projectConfiguration: Configuration {
		switch self {
		case .debug:
			return .debug(name: configurationName, xcconfig: projectConfigPath)
		case .release:
			return .release(name: configurationName, xcconfig: projectConfigPath)
		case .beta:
			return .release(name: configurationName, xcconfig: projectConfigPath)
		}
	}
}

extension StringProtocol {
	public var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
