import Foundation
import ProjectDescription

extension Scheme {
    public static func debug(for target: String, packages: [String] = [], executable: String? = nil) -> Scheme {
		scheme(for: .debug, target: target, packages: packages, executable: executable)
    }

    public static func release(for target: String, packages: [String] = [], executable: String? = nil) -> Scheme {
		scheme(for: .release, target: target, packages: packages, executable: executable)
    }

    public static func beta(for target: String, packages: [String] = [], executable: String? = nil) -> Scheme {
		scheme(for: .beta, target: target, packages: packages, executable: executable)
    }

    public static func scheme(
        for env: BuildEnvironment,
        target: String,
		packages: [String],
        executable: String? = nil
    ) -> Scheme {
        let config = env.configurationName
        var executableTarget: TargetReference?
        if let executable {
            executableTarget = "\(executable)"
        }
        return .scheme(
            name: "\(target)-\(env.name)",
            shared: true,
			buildAction: .buildAction(targets: ["\(target)"] + packages.map {TargetReference(projectPath: .relativeToRoot("App/Features/\(target)"), target: $0)}),
            testAction: .targets(
				["\(target)Tests"] + packages.map {"\($0)Tests"},
                configuration: config
            ),
            runAction: .runAction(
                configuration: config,
                executable: executableTarget
            ),
            archiveAction: .archiveAction(configuration: env.configurationName),
            profileAction: .profileAction(
                configuration: env.configurationName,
                executable: executableTarget
            ),
            analyzeAction: .analyzeAction(configuration: env.configurationName)
        )
    }

    public static func allSchemes(for targets: [String], packages: [String] = [], executable: String? = nil) -> [Scheme] {
        targets.flatMap { target in
            BuildEnvironment
                .allCases
				.map { scheme(for: $0, target: target, packages: packages, executable: executable) }
        }
    }

    public static func scheme(
        name: String,
        shared: Bool = true,
        hidden: Bool = false,
        buildAction: ProjectDescription.BuildAction? = nil,
        testAction: ProjectDescription.TestAction? = nil,
        runAction: ProjectDescription.RunAction? = nil,
        archiveAction: ProjectDescription.ArchiveAction? = nil,
        profileAction: ProjectDescription.ProfileAction? = nil,
        analyzeAction: ProjectDescription.AnalyzeAction? = nil
    ) -> Scheme {
        Scheme(
            name: name,
            shared: shared,
            hidden: hidden,
            buildAction: buildAction,
            testAction: testAction,
            runAction: runAction,
            archiveAction: archiveAction,
            profileAction: profileAction,
            analyzeAction: analyzeAction
        )
    }
}
