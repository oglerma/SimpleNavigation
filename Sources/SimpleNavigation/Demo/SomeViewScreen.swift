
import SwiftUI

struct SomeViewScreen: NavigableView {
    @Environment(NavigationRouter.self) var router: NavigationRouter
    var viewIdentifier = "SomeViewScreen"
    var body: some View {
        VStack {
            Text("Entered Another View that conforms to NavigableView")
            Button {
                router.popToRoot()
            } label: {
                Text("Pop to root")
            }
        }
    }
}

extension SomeViewScreen {
    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(viewIdentifier)
    }
    
    nonisolated static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.viewIdentifier == rhs.viewIdentifier
    }
}


