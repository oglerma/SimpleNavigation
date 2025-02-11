
import SwiftUI

struct TabScreenExample: View {
    @State private var navigationRouter = NavigationRouter()
    let tab: TabSelection

    var body: some View {
        SNavigationStack {
            VStack {
                Text(tab.rawValue)

                Button("Go to Profile Screen") {
                    navigationRouter.navigateTo(destination: ProfileScreen())
                }
            }
        }
        .environment(navigationRouter)
    }
}
