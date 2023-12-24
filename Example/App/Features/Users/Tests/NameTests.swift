@testable import UsersInterface
import XCTest
import XCTMycelium

final class NameTests: XCTestCase {
	func test_init_deliversErrorOnNilValue() throws {
		try XCTThrowsExactly(User.Name(value: nil), error: User.Error.invalidNameValue)
	}

	func test_init_deliversErrorOnEmptyString() throws {
		try XCTThrowsExactly(User.Name(value: ""), error: User.Error.invalidNameValue)
	}
}
