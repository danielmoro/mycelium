import XCTest
@testable import UsersTesting
@testable import UsersCore
import UsersInterface
import ConcurrencyExtras

final class UsersTests: XCTestCase {
	override func invokeTest() {
		withMainSerialExecutor {
			super.invokeTest()
		}
	}
	
    func test_fails() throws {
		XCTFail()
    }
}
