import XCTest
import XCTMycelium
@testable import UsersCore
@testable import UsersInterface

final class NameTests: XCTestCase {
	func test_init_deliversErrorOnNilValue() throws {
		try XCTThrowsExactly(UserEntity.Name(value: nil), error: UserEntity.Error.invalidNameValue)
	}

	func test_init_deliversErrorOnEmptyString() throws {
		try XCTThrowsExactly(UserEntity.Name(value: ""), error: UserEntity.Error.invalidNameValue)
	}
}
