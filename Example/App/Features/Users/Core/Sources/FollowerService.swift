import Foundation
import UsersInterface

final class FollowerService {
	enum Error: Swift.Error {
		case cannotFollowSelf
		case cannotFollowNonPublicUser
		case alreadyFollowing
	}

	private let followersRepository: FollowersRepository

	init(followersRepository: FollowersRepository) {
		self.followersRepository = followersRepository
	}

	func user(_ user: UserEntity, startFollowing followed: UserEntity, on date: Date) async throws {
		guard user.id != followed.id else {
			throw Error.cannotFollowSelf
		}

		guard followed.hasPublicProfile else {
			throw Error.cannotFollowNonPublicUser
		}

		guard await followersRepository.isUser(user.id, alreadyFollowingUser: followed.id) else {
			throw Error.alreadyFollowing
		}

		let follower = FollowerEntity(userID: user.id, followedID: followed.id, created: date)
		await followersRepository.create(follower: follower.descriptor)
	}
}

extension FollowerEntity {
	var descriptor: Follower {
		.init(userID: id.user, followedID: id.followed, created: created)
	}
}
