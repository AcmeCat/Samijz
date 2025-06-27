//
//  OrderTests.swift
//  SamijzTests
//
//  Created by Rory Allen on 27/6/2025.
//

import XCTest

final class OrderTests: XCTestCase {

    func test_initWithNoSavedFile_loadsEmptyServings() {
        let order = Order()
        XCTAssertTrue(order.servings.isEmpty, "Expected servings to be empty when no saved file exists")
    }

}
