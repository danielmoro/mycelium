import Foundation
import Mycelium
import UsersInterface

final class UserEntity: Entity<UserID, UserEvent> {
	enum Error: Swift.Error {
		case invalidNameValue
	}

	struct Name {
		let value: String

		public init(value: String?) throws {
			guard let value, value.isEmpty == false else {
				throw Error.invalidNameValue
			}

			self.value = value
		}
	}

	private(set) var name: Name
	private(set) var hasPublicProfile: Bool = false

	private init(id: UserID, name: Name) {
		self.name = name
		super.init(id: id)
	}

	static func make(name: Name, uuidProvider: () -> UUID = UUID.init) -> UserEntity {
		let id = uuidProvider()
		let user = UserEntity(id: id, name: name)

		user.raise(event: .userCreated(id: id))
		return user
	}
}
