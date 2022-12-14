//
//  MainPage.swift
//  ExampleUITests
//
//  Created by Jules Moorhouse
//

import XCTest

struct MainPage: Screen {
    let app: XCUIApplication

    func verifyOnPage() -> MainPage {
        _ = textField3()
        _ = textField4()
        
        return self
    }
    
    private func textField3() -> XCUIElement {
        let item = app.descendants(matching: .any)[
            "\(AccessibilityIdentifiers.thirdField)"
        ]

        _ = item.waitForExistence(timeout: 3.0)
        
        XCTAssertTrue(item.exists, "Field3 not found!")
        
        return item
    }

    private func textField4() -> XCUIElement {
        let item = app.descendants(matching: .any)[
            "\(AccessibilityIdentifiers.fourthField)"
        ]
        
        _ = item.waitForExistence(timeout: 3.0)
        
        XCTAssertTrue(item.exists, "Field4 not found!")
        
        return item
    }
    
    private func textField3Focused() -> XCUIElement {
        let item = app.descendants(matching: .any)[
            "\(AccessibilityIdentifiers.thirdField.focusId())"
        ]
        
        _ = item.waitForExistence(timeout: 3.0)
        
        XCTAssertTrue(item.exists, "Field3 focused not found!")
        
        return item
    }

    private func textField4Focused() -> XCUIElement {
        let item = app.descendants(matching: .any)[
            "\(AccessibilityIdentifiers.fourthField.focusId())"
        ]
        
        _ = item.waitForExistence(timeout: 3.0)
        
        XCTAssertTrue(item.exists, "Field4 focused not found!")
        
        return item
    }
    
    private func setFieldButton3() -> XCUIElement {
        let item = app.buttons[
            "\(AccessibilityIdentifiers.thirdSetFieldButton)"
        ].firstMatch
        
        _ = item.waitForExistence(timeout: 3.0)
        
        XCTAssertTrue(item.exists, "setFieldButton3 not found!")
        
        return item
    }
    
    private func setFieldButton4() -> XCUIElement {
        let item = app.buttons[
            "\(AccessibilityIdentifiers.fourthSetFieldButton)"
        ].firstMatch
        
        _ = item.waitForExistence(timeout: 3.0)
        
        XCTAssertTrue(item.exists, "setFieldButton4 not found!")
        
        return item
    }

    @discardableResult func tapSetFieldButton3() -> Self {
        setFieldButton3().tap()
        return self
    }

    @discardableResult func tapSetFieldButton4() -> Self {
        setFieldButton4().tap()
        return self
    }

    @discardableResult func waitForTextField3() -> Self {
        _ = textField3Focused()
        return self
    }

    @discardableResult func waitForTextField4() -> Self {
        _ = textField4Focused()
        return self
    }
}
