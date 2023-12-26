import Foundation
import Mycelium

public struct Follower {
	let userID: UserID
	let followedID: UserID
	let created: Date

	public init(userID: UserID, followedID: UserID, created: Date) {
		self.userID = userID
		self.followedID = followedID
		self.created = created
	}
}

public enum FollowerEvent: DomainEvent {}
