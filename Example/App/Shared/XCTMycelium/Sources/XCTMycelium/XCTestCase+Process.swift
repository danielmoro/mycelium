import Foundation
import XCTest

public extension XCTestCase {
	func performAsync<T: Sendable>(
		process: @escaping @Sendable () async throws -> T,
		onBeforeCompletion: () -> Void,
		onAfterCompletion: (T, StaticString, UInt) -> Void,
		file: StaticString = #filePath,
		line: UInt = #line
	) async throws {
		let task = Task { try await process() }
		await Task.yield()
		onBeforeCompletion()
		let value = try await task.value
		onAfterCompletion(value, #filePath, #line)
	}
}
