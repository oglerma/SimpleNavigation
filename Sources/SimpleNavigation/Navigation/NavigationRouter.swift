import SwiftUI
import Observation

@Observable
public class NavigationRouter {
    public var path = NavigationPath()
    
    public init() {
        
    }
    
    public func navigateTo<T: NavigableView>(destination view: T) {
        path.append(DestinationWrapper(content: { view }))
    }
    
    /// Pops the last destination from the navigation stack
    public func popDestination() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    /// Pops all destinations, returning to the root view
    public func popToRoot() {
        path.removeLast(path.count)
    }
}
