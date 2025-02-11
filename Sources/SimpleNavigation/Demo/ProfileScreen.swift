
import SwiftUI

struct ProfileScreen: NavigableView {
    let viewIdentifier = "ProfileScreen"
    @Environment(NavigationRouter.self) var router: NavigationRouter
    var body: some View {
        VStack {
            Button {
                router.navigateTo(destination: SomeViewScreen())
            } label: {
                Text("Navigate to Another Screen")
            }
                        
            Button {
                router.popDestination()
            } label: {
                Text("Pop View")
            }
        }
    }
}

extension ProfileScreen {
    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(viewIdentifier)
    }
    
     nonisolated static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.viewIdentifier == rhs.viewIdentifier
    }
}
