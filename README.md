# SimpleNavigation SwiftUI iOS 18+

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

targets: [
    .target(
        name: "YourApp",
        dependencies: ["SimpleNavigation"]
    )
]
```

After updating your package dependencies, import SimpleNavigation in the necessary files:

```swift
import SimpleNavigation
```

See the Examples in this project. 


## Example Usage

To integrate `SimpleNavigation` into your SwiftUI project, follow these steps:

### 1. Conform to the `NavigableView` Protocol

Each destination view must conform to the `NavigableView` protocol to be used in the navigation stack.

```swift
import SwiftUI
import SimpleNavigation

struct ProfileScreen: NavigableView {
    let viewIdentifier = "ProfileScreen"
    var body: some View {
        VStack {
            Text("Welcome to the Profile Screen")
        }
        .navigationTitle("Profile")
    }
}

extension ProfileScreen {
    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(viewIdentifier)
    }
    
     nonisolated static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.viewIdentifier == rhs.viewIdentifier
    }
}
```

### 2. Pass in the NavigationRouter Object Using .environment

To manage navigation, create a NavigationRouter instance and pass it to your SwiftUI views using the .environment modifier.

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
### 3. Preview the Navigation Behavior

You can also preview your navigation behavior using SwiftUI previews.

```swift
#Preview {
    @Previewable @State var router = NavigationRouter()
    SNavigationStack {
        VStack {
            Button {
                router.navigateTo(destination: ProfileScreen())
            } label: {
                Text("Navigate to Profile Screen")
            }
        }
    }
    .environment(router)
}
```
