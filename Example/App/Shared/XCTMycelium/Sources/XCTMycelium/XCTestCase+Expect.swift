import CustomDump
import XCTest

public extension XCTestCase {
	func expect<T: Equatable & Sendable, E: Error & Equatable>(
		_ action: @Sendable @escaping () async throws -> T,
		toCompleteWith result: () -> Result<T, E>,
		when event: () -> Void,
		file: StaticString = #filePath,
		line: UInt = #line
	) async {
		let expectedResult = result()
		do {
			try await performAsync(process: action, onBeforeCompletion: event) { receivedItems, file, line in
				if case let .success(expectedItems) = expectedResult {
					XCTAssertNoDifference(receivedItems, expectedItems, file: file, line: line)
				} else {
					XCTFail("expected \(expectedResult), got \(receivedItems) instead")
				}
			}
		} catch {
			let receivedResult: Result<T, Error> = .failure(error)
			switch (receivedResult, expectedResult) {
			case let (.failure(receivedError as E), .failure(expectedError)):
				XCTAssertNoDifference(receivedError, expectedError, file: file, line: line)
			default:
				XCTFail("expected \(expectedResult) got \(receivedResult) instead", file: file, line: line)
			}
		}
	}
}
