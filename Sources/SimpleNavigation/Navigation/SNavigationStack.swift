import SwiftUI

public struct SNavigationStack<Content: View>: View {
    @Environment(NavigationRouter.self) var router
    @ViewBuilder private var content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        @Bindable var bindableRouter = router
        NavigationStack(path: $bindableRouter.path) {
            content()
                .navigationDestination(for: DestinationWrapper.self) { destination in
                    destination.content()
                }
        }
    }
}

/*************************************
 if we don't want to use:
 
 ```
 @Bindable var routerBindable = router
 ```
 then we can just create the path below like so:
 
 private var pathBinding: Binding<NavigationPath> {
        Binding(
            get: { router.path },
            set: { router.path = $0 }
        )
 }
 
 and then pass it in the NavigationStack, like so:
 
 NavigationStack(path: pathBinding) {
 .......
 }
 
 **************************************/
