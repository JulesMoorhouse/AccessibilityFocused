//
//  AccessibilityIdentifiers.swift
//  Example
//
//  Created by Jules Moorhouse
//

import AccessibilityFocused
import Foundation

public enum AccessibilityIdentifiers: Equatable, CaseIterable {
    case nothing

    case thirdField
    case fourthField
    case thirdSetFieldButton
    case fourthSetFieldButton

    func automatedId() -> String {
        String(describing: self)
    }

    func focusId() -> String {
        String(describing: self) + "-focused"
    }

    func focusIdentity() -> FocusIdentity {
        (accessibilityId: automatedId(), uiTestFocusId: focusId())
    }
}
