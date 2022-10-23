# AccessibilityFocused

[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/JulesMoorhouse/AccessibilityFocused/main/LICENSE)

A description of this package.

A SwiftUI implementation of the iOS 15 AccessibilityFocused view modifier for iOS 14.

## Installation

### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/JulesMoorhouse/AccessibilityFocused.git", from: "1.0.0")
]
```

## Usage:
Import the package into the file with `import AccessibilityFocused`.

There are two different ways to use AccessibilityFocused, however both need to set an AccessibilityIdentifier. This is required to provide a handle to indicate which field is being focused.

Here's the most basic implementation, obviously you'd need another field to gave a different focus, with this being the only field. Notice that unlike the iOS 15 version of `accessibilityFocused` we use state as for the boolean value.

So if you evet stop using this spm you would just drop state name.

```
import AccessibilityFocused
import SwiftUI

struct ContentView: View {

    @State private var accessibilityFocus1: Bool = false
    @State private var text1 = ""

    var body: some View {
        TextField("Text 1", text: $text1)
            .accessibilityFocused(state: $accessibilityFocus1)
    }
}
```

A more complex example, allowing you to UI Test this functionality is shown below. Although the iOS simulator doesn't show accessibility focus, as workaround, just for UI Testing, the SPM changes the accessibility identifier when focus is set.

