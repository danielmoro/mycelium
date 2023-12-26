import Foundation
import Mycelium
import UsersInterface

final class FollowerEntity: Entity<(user: UserID, followed: UserID), FollowerEvent> {
	let created: Date

	init(userID: UserID, followedID: UserID, created: Date) {
		self.created = created
		super.init(id: (userID, followedID))
	}
}
