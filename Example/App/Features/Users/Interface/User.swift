import Foundation
import Mycelium

public typealias UserID = UUID
public final class User: Entity<UserID, UserEvent> {
	enum Error: Swift.Error {
		case invalidNameValue
	}

	public struct Name {
		let value: String

		public init(value: String?) throws {
			guard let value, value.isEmpty == false else {
				throw Error.invalidNameValue
			}

			self.value = value
		}
	}

	public private(set) var name: Name

	private init(id: UserID, name: Name) {
		self.name = name
		super.init(id: id)
	}

	public static func make(name: Name, uuidProvider: () -> UUID = UUID.init) -> User {
		let id = uuidProvider()
		let user = User(id: id, name: name)

		user.raise(event: .userCreated(id: id))
		return user
	}
}

public enum UserEvent: DomainEvent, Equatable {
	case userCreated(id: UserID)
}
