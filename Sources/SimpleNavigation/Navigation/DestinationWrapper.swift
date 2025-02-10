
import SwiftUI

/// A wrapper type that encapsulates a navigable view destination
///
/// This internal type is used by the `NavigationRouter` to wrap destination views in a way that:
/// - Preserves type erasure through `AnyView`
/// - Maintains `Hashable` conformance for navigation path storage
/// - Provides stable identity through a UUID

internal struct DestinationWrapper: Hashable {
    private let id = UUID()
    let content: () -> AnyView

    init<T: NavigableView>(@ViewBuilder content: @escaping () -> T) {
        self.content = { AnyView(content()) }
    }

    static func == (lhs: DestinationWrapper, rhs: DestinationWrapper) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
