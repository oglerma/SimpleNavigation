
import SwiftUI

struct ProfileScreen: View {
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
