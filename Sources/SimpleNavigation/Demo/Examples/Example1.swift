import SwiftUI

#Preview {
    @Previewable @State var router = NavigationRouter()
    SNavigationStack {
        VStack {
            Button {
                router.navigateTo(destination: ProfileScreen())
            } label: {
                Text("Navigate to Profile Screen NavigableView")
            }
        }
    }
    .environment(router)
}
