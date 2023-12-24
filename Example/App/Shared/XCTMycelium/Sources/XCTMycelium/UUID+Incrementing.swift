import Foundation

public extension UUID {
	private static var uuid = 0

	static var incrementing: UUID {
		defer { uuid += 1 }
		return UUID(uuidString: "00000000-0000-0000-0000-\(String(format: "%012x", uuid))")!
	}

	static func reset() {
		uuid = 0
	}
}
