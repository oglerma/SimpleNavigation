
import SwiftUI

#Preview {
    MainView()
}

struct MainView: View {
    @State private var selectedTab: TabSelection = .profile

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Profile", systemImage: "person", value: .profile) {
                TabScreenExample(tab: .profile)
            }

            Tab("Home", systemImage: "archivebox", value: .home) {
                TabScreenExample(tab: .home)
            }

            Tab("Search", systemImage: "sensor.tag.radiowaves.forward.fill", value: .search) {
                TabScreenExample(tab: .search)
            }
        }
    }
}
