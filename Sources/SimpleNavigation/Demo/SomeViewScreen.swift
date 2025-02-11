
import SwiftUI

struct SomeViewScreen: View {
    @Environment(NavigationRouter.self) var router: NavigationRouter
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
