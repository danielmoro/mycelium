import Foundation
import Mycelium

public typealias UserID = UUID

public enum UserEvent: DomainEvent, Equatable {
	case userCreated(id: UserID)
}
