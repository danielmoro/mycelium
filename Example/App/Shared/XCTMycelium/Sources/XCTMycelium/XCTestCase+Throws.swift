import XCTest

public extension XCTestCase {
	func XCTThrowsExactly<E>(
		_ expression: @autoclosure () throws -> some Any,
		error expectedError: E,
		_ message: @autoclosure () -> String = "",
		file: StaticString = #filePath,
		line: UInt = #line
	) where E: Error & Equatable {
		do {
			_ = try expression()
		} catch {
			XCTAssertEqual(error as? E, expectedError)
		}
	}
}
