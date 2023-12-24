import XCTest

public extension XCTestCase {
	func XCTThrowsExactly<T, E>(
		_ expression: @autoclosure () throws -> T,
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
