
enum TabSelection: String, CaseIterable, Hashable {
    case profile
    case home
    case search
    
    static func allowedHomeTabs() -> [TabSelection] {
        // We can guard these alllowed tabs by giving conditions to either add a Tab or not depending
        // on how we want to feature these tabs.
        return [.profile, .home, .search]
    }
}
