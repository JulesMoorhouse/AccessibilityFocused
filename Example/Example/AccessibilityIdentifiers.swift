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

    case firstField
    case secondField

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
