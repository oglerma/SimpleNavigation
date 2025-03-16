# SimpleNavigation SwiftUI iOS 16+

SimpleNavigation is a Swift package designed to facilitate straightforward navigation management in Swift applications. It provides a streamlined approach to handle navigation tasks, making it easier for developers to implement and manage navigation flows within their apps.

## Features

- **Simplified Navigation Handling**: Offers an intuitive API to manage navigation between views.
- **Lightweight**: Minimal overhead, ensuring efficient performance.
- **Easy Integration**: Seamlessly integrates into existing Swift projects.

## Installation

To integrate SimpleNavigation into your Swift project, you can use Swift Package Manager. Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/oglerma/SimpleNavigation.git", from: "1.0.0")
]
```

After updating your package dependencies, import SimpleNavigation in the necessary files:

```swift
import SimpleNavigation
```

See the Examples in this project. 


## Example Usage


```swift
import SimpleNavigation

struct HomeScreen: View {
    @State private var router = NavigationRouter()

    var body: some View {
        SNavigationStack {
            VStack {
                Button {
                    router.navigateTo(destination: ProfileScreen())
                } label: {
                    Text("Navigate to Profile Screen")
                }
            }
            .padding()
        }
        .environment(router) // Inject the router into the environment
    }
}
```

The magic happens inside of `DestinationWrapper` : 

```swift
struct DestinationWrapper: Hashable {
    private let id = UUID()
    let content: () -> AnyView

    init<T: View>(@ViewBuilder content: @escaping () -> T) {
        self.content = { AnyView(content()) }
    }

    static func == (lhs: DestinationWrapper, rhs: DestinationWrapper) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
```

Which is the used in a Custom component called `SNavigationStack`: 

```swift
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
```



