# AccessibilityFocused

[![Swift](https://github.com/JulesMoorhouse/AccessibilityFocused/actions/workflows/swift.yml/badge.svg?branch=main)](https://github.com/JulesMoorhouse/AccessibilityFocused/actions/workflows/swift.yml) [![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/JulesMoorhouse/AccessibilityFocused/main/LICENSE)

A SwiftUI implementation of the iOS 15 AccessibilityFocused view modifier for iOS 14.

## Installation

### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/JulesMoorhouse/AccessibilityFocused.git", from: "1.0.0")
]
```

> **⚠️ Note:** [AccessibilityFocused](https://developer.apple.com/documentation/swiftui/grid/accessibilityfocused(_:)) only works on a physical device, you must also turn on voice over (or see UI Testing below).

## Usage:
Import the package into your swift file with `import AccessibilityFocused`.

There are two different ways to use `AccessibilityFocused`, under the hood this sets an `AccessibilityIdentifier`. This is required to provide a handle to indicate which field is being focused.

Here's the most basic implementation, obviously you'd need another element to gave a different focus, with this being the only field. Notice that unlike the iOS 15 version of `accessibilityFocused` we use `state` for the boolean value.

So if you ever stop using this spm (if you drop iOS 14) you would just need drop the state name.

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

## UI Testing
A more complex example, allowing you to UI Test this functionality is also shown in the example project.

Although the iOS simulator doesn't show accessibility focus, this more complex usage has been provided as workaround, just for UI Testing.

This SPM changes the accessibility identifier to the focusId when focus is set, so you can prove your code works with accessibility focus.

This has been added as it's very easy to break accessibility and it's not something easy to test by hand.

### Requirements

- iOS 14.0+

## iOS 13
I tried to provide iOS 13 support, in fact you can see a `iOS13-Support` branch, which has issues. In `AccessibilityFocusSetterModifier.swift` the `makeUIView` method, the return `controller.view` freezes the iOS simulator. I have tried to wrap the view in a UIView, however there are sizing issues and you can not select the text in the textfield. I'd be happy for any help on this.

## :clap: Contribution

All Pull Requests (PRs) are welcome to help make this library better.

## License

AccessibilityFocused is available under the MIT license. See the [LICENSE](https://github.com/JulesMoorhouse/AccessibilityFocused/blob/main/LICENSE) file for more info.
