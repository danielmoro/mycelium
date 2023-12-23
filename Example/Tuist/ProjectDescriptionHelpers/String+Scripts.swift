import Foundation

public extension String {
	static func lintScript(at path: String) -> String {
		"""
		#!/bin/bash
		export PATH="$PATH:/opt/homebrew/bin"

		if which swiftformat > /dev/null; then
		 swiftformat "\(path)" --lint
		else
		echo "warning: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat.git"
		fi

		if which swiftlint > /dev/null; then
		swiftlint "\(path)"
		else
		echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
		fi
		"""
	}
}
