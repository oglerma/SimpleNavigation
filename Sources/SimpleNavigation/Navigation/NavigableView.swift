
import SwiftUI


public protocol NavigableView: Hashable, View, Identifiable {
    var id: UUID { get }
}

public extension NavigableView {
    var id: UUID {
        UUID()
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
