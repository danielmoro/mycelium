import ConcurrencyExtras
import UsersInterface
import XCTest
import XCTMycelium
@testable import UsersCore

final class UsersTests: XCTestCase {
	override func invokeTest() {
		withMainSerialExecutor {
			super.invokeTest()
		}
	}

	func test_make_raisesDomainEvent() throws {
		let validName = try XCTUnwrap(UserEntity.Name(value: "Valid Name Value"))

		let sut = UserEntity.make(name: validName, uuidProvider: { UUID.incrementing })

		XCTAssertEqual(sut.events, [
			.userCreated(id: UUID(uuidString: "00000000-0000-0000-0000-000000000000")!)
		])
	}
}
