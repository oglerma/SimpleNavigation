
import SwiftUI

internal struct DestinationWrapper: Hashable {
    let id = UUID()
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
