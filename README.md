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
