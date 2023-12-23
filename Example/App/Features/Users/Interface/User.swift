public final class User {
	enum Error: Swift.Error {
		case invalidNameValue
	}

	public struct Name {
		let value: String

		init(value: String?) throws {
			guard let value else {
				throw Error.invalidNameValue
			}

			self.value = value
		}
	}

	public private(set) var name: Name

	private init(name: Name) {
		self.name = name
	}
}
