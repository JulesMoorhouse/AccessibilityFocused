//
//  AccessibilityFocused.swift
//  AccessibilityFocused
//
//  Created by Jules Moorhouse
//

import SwiftUI

public typealias FocusIdentity = (accessibilityId: String, uiTestFocusId: String)

public extension View {
    @ViewBuilder func accessibilityFocused(
        _ state: Binding<Bool>,
        identifier: FocusIdentity
    ) -> some View {
        if #available(iOS 15, *) {
            modifier(
                AccessibilityFocusModifier(
                    state,
                    identifier: identifier
                )
            )
        } else {
            modifier(
                AccessibilityFocusSetterModifier(
                    state,
                    identifier: identifier
                )
            )
        }
    }

    @ViewBuilder func accessibilityFocused(
        state: Binding<Bool>
    ) -> some View {
        let uuid = UUID().uuidString
        let identifier = (accessibilityId: uuid, uiTestFocusId: uuid)

        if #available(iOS 15, *) {
            modifier(AccessibilityFocusModifier(state, identifier: identifier))
        } else {
            modifier(AccessibilityFocusSetterModifier(state, identifier: identifier))
        }
    }
}
