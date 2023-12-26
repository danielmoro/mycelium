public protocol FollowersRepository {
	func isUser(_ user: UserID, alreadyFollowingUser followedUserID: UserID) async -> Bool
	func create(follower: Follower) async
}
