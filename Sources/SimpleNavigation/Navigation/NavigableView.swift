
import SwiftUI

/// A protocol that marks views as navigable destinations
///
/// This protocol extends SwiftUI's `View` protocol with additional requirements:
/// - Conformance to `Hashable` for navigation path storage
/// - Conformance to `Identifiable` for stable identity

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
