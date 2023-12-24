import ConcurrencyExtras
import CustomDump
import XCTest

// swiftlint:disable function_parameter_count
public extension XCTestCase {
	func trackChange<SUT, T: Equatable>(
		of property: KeyPath<SUT, T>,
		in sut: SUT,
		on event: () -> Void,
		expectValueBefore before: () -> T,
		expectValueAfter after: () -> T,
		when action: () -> Void,
		file: StaticString = #filePath,
		line: UInt = #line
	) async {
		event()

		await Task.yield()
		await Task.megaYield()

		XCTAssertNoDifference(sut[keyPath: property], before())

		await Task.yield()

		action()

		await Task.yield()

		XCTAssertNoDifference(sut[keyPath: property], after())
	}
}

// swiftlint:enable function_parameter_count
