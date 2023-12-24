import CustomDump
import Foundation
import XCTest

// swiftlint:disable force_try
public extension XCTestCase {
	func makeJSON(withObjects objects: [[String: Any]]) -> Data {
		try! JSONSerialization.data(withJSONObject: objects)
	}

	func makeJSON(withObject object: [String: Any]) -> Data {
		try! JSONSerialization.data(withJSONObject: object)
	}

	func makeJSON(withArray objects: [String]) -> Data {
		try! JSONSerialization.data(withJSONObject: objects)
	}

	func assertEqual(_ lhs: Data, _ rhs: Data, file: StaticString = #filePath, line: UInt = #line) throws {
		let lhsDictionary = try XCTUnwrap(
			JSONSerialization.jsonObject(with: lhs, options: []) as? NSDictionary,
			file: file,
			line: line
		)
		let rhsDictionary = try XCTUnwrap(
			JSONSerialization.jsonObject(with: rhs, options: []) as? NSDictionary,
			file: file,
			line: line
		)

		XCTAssertNoDifference(lhsDictionary, rhsDictionary)

//		XCTAssertTrue(
//			lhsDictionary.isEqual(to: rhsDictionary as! [AnyHashable: Any]),
//			"expected \(lhsDictionary), got \(rhsDictionary)",
//			file: file,
//			line: line
//		)
	}
}

// swiftlint:enable force_try
