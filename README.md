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

> **⚠️ Note:** [AccessibilityFocused](https://developer.apple.com/documentation/swiftui/grid/accessibilityfocused(_:)) only works on a physical device, you must also turn on voice over.

## Usage:
Import the package into the file with `import AccessibilityFocused`.

There are two different ways to use AccessibilityFocused, both need to set a AccessibilityIdentifier. This is required to provide a handle to indicate which field is being focused.

Here's the most basic implementation, obviously you'd need another element to gave a different focus, with this being the only field. Notice that unlike the iOS 15 version of `accessibilityFocused` we use state as for the boolean value.

So if you ever stop using this spm you would just need drop the state name.

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

A more complex example, allowing you to UI Test this functionality is shown in the example project. Although the iOS simulator doesn't show accessibility focus, as workaround, just for UI Testing, the SPM changes the accessibility identifier when focus is set.

### Requirements

- iOS 14.0+

## iOS 13
I tried to provide iOS 13 support, in fact you can see a `iOS13-Support` branch, which has issues. In `AccessibilityFocusSetterModifier.swift` the `makeUIView` method, the return controller.view freezes the iOS simulator. I have tried to wrap the view in a UIView, however there are sizing issues and you can not select the text in the textfield. I'd be happy for any help on this.

## :clap: Contribution

All Pull Requests (PRs) are welcome to help make this library better.

## License

AccessibilityFocused is available under the MIT license. See the [LICENSE](https://github.com/JulesMoorhouse/AccessibilityFocused/blob/main/LICENSE) file for more info.
