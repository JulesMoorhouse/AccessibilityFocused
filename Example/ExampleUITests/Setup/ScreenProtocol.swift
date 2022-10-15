//
//  ScreenProtocol.swift
//  ExampleUITests
//
//  Created by Jules Moorhouse on 15/10/2022.
//  Copyright © 2022 Mindwarp Consultancy Ltd. All rights reserved.
//

import XCTest

protocol Screen {
    var app: XCUIApplication { get }

    @discardableResult func verifyOnPage() -> Self
}
