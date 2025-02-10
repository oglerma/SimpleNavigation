//
//  Example2.swift
//  SimpleNavigation
//
//  Created by Ociel Lerma on 2/10/25.
//

import SwiftUI

@Observable
private class AppViewModel {
    var navigationRouters: [Tab: NavigationRouter] = [:]
    var selectedTab: Tab = .profile
    
    init() {
        initializeTabs()
    }
    
    private func initializeTabs() {
        var dictionary: [Tab: NavigationRouter] = [:]
        Tab.allCases.forEach { dictionary[$0] = NavigationRouter() }
        navigationRouters = dictionary
    }
}

struct MainView: View {
    @State private var appViewModel = AppViewModel()
    var body: some View {
        TabView(selection: $appViewModel.selectedTab) {
            TabScreenExample(tab: Tab.profile)
                .tag(Tab.profile)
                .environment(appViewModel.navigationRouters[Tab.profile]!)
            
            TabScreenExample(tab: Tab.home)
                .environment(appViewModel.navigationRouters[Tab.home]!)
        }
        .tabViewStyle(.page)
    }
}

struct TabScreenExample: View {
    @Environment(NavigationRouter.self) var navigationRouter
    let tab: Tab
    
    var body: some View {
        SNavigationStack {
            VStack {
                Text(tab.rawValue)
                
                Button("Go to Profile Screen") {
                    navigationRouter.navigateTo(destination: ProfileScreen())
                }
            }
        }
    }
}

enum Tab: String, CaseIterable, Hashable {
    case profile
    case home
    case search
    
    static func allowedHomeTabs() -> [Tab] {
        // We can guard these alllowed tabs by giving conditions to either add a Tab or not depending
        // on how we want to feature these tabs.
        return [.profile, .home, .search]
    }
}


#Preview {
    MainView()
}
