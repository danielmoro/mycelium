public protocol FollowersRepository {
	func check(_ user: UserID, isFollowing otherUser: UserID) async -> Bool
	func create(follower: Follower) async
}
