//
//  ExampleUITests.swift
//  ExampleUITests
//
//  Created by Jules Moorhouse
//

import XCTest

final class ExampleUITests: UITestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testExample() throws {
        MainPage(app: app)
            .verifyOnPage()
            .tapSetFieldButton3()
            .waitForTextField3()
            .tapSetFieldButton4()
            .waitForTextField4()
    }
}
