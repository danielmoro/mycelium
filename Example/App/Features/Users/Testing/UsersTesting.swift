import UsersInterface

//struct UsersInterfaceSpy: UsersInterface {
//
//}
//
//let mockData: [Int] = [
//	1,
//	2
//]
//
//public enum MockUsersInterface {
//	private struct Mocker: UsersInterface {
//		var result: Result<[Int], Error>
//		var delay: Duration?
//
//		//TODO: - Replace with protocol implementation
//		func load() async throws -> [Int] {
//			if let delay {
//				try await Task.sleep(for: delay)
//			}
//
//			return try result.get()
//		}
//	}
//
//	public static var regular: UsersInterface {
//		Mocker(result: .success(mockData))
//	}
//
//	public static var empty: UsersInterface {
//		Mocker(result: .success([]))
//	}
//
//	public static var loading: UsersInterface {
//		Mocker(result: .success(mockData), delay: .seconds(3))
//	}
//
//	public static func failing(_ error: Error) -> UsersInterface {
//		Mocker(result: .failure(error))
//	}
//}
