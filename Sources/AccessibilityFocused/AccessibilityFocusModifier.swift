//
//  AccessibilityFocusModifier.swift
//  AccessibilityFocused
//
//  Created by Jules Moorhouse
//

import SwiftUI

@available(iOS 15, *)
struct AccessibilityFocusModifier: ViewModifier {
    @Binding var state: Bool
    @State private var accessibilityIdentifier: String = ""
    @AccessibilityFocusState var focused: Bool

    private let identifier: FocusIdentity
    private static var currentFocusIdentifier = ""

    init(
        _ state: Binding<Bool>,
        identifier: FocusIdentity
    ) {
        _state = state
        self.identifier = identifier
        _accessibilityIdentifier = State(wrappedValue: identifier.accessibilityId)
    }

    func body(content: Content) -> some View {
        content
            .accessibilityFocused($focused, equals: true)
            .accessibilityIdentifier(accessibilityIdentifier)
            .onChange(of: state, perform: changeFocus)
            .onAppear {
                if $state.wrappedValue == true {
                    changeFocus(true)
                }
            }
            .onChange(of: $state.wrappedValue) { value in
                changeFocus(value)

                if value == true {
                    #if targetEnvironment(simulator)
                        accessibilityIdentifier = identifier.uiTestFocusId

                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            accessibilityIdentifier = identifier.accessibilityId
                        }
                    #endif
                }
            }
            .onChange(of: AccessibilityFocusModifier.currentFocusIdentifier) { value in
                if value != identifier.0 {
                    focused = false
                    state = false
                }
            }
    }

    private func changeFocus(_ value: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) {
            focused = value
            if value {
                AccessibilityFocusModifier.currentFocusIdentifier = identifier.0
            }
        }
    }
}
