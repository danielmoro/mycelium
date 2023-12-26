
open class Entity<ID, Event: DomainEvent>: Identifiable {
	public let id: ID
	var internalEvents: [Event] = []
	
	public var events: [Event] {
		get {
			internalEvents
		}
	}
	
	public init(id: ID) {
		self.id = id
	}
	
	public func raise(event: Event) {
		internalEvents.append(event)
	}
}
