//
//  OrderTests.swift
//  SamijzTests
//
//  Created by Rory Allen on 27/6/2025.
//

import XCTest

final class OrderTests: XCTestCase {

    func test_initWithNoSavedFile_loadsEmptyServings() {
        let order = Order(storage: EmptyStorageStub())
        
        XCTAssertTrue(order.servings.isEmpty, "Expected servings to be empty when no saved file exists")
    }
    
    func test_initWithSavedFile_loadsSavedServings() {
        let savedServings: [Serving] = [
            .init(id: UUID(), name: "Test 1", description: "Test 1 description", calories: 100, cost: 1),
            .init(id: UUID(), name: "Test 2", description: "Test 2 description", calories: 200, cost: 2)
        ]
        let savedStorage = SavedStorageStub(servings: savedServings)
        
        let order = Order(storage: savedStorage)
        
        XCTAssertEqual(order.servings, savedServings, "Expected loaded servings to match saved servings")
    }
    
    func test_saveOrder_savesServingsToStorage() {
        let spy = SpyStorage()
        let order = Order(storage: spy)
        let expectedServings: [Serving] = [
            .init(id: UUID(), name: "Test 1", description: "Test 1 description", calories: 100, cost: 1),
            .init(id: UUID(), name: "Test 2", description: "Test 2 description", calories: 200, cost: 2)
        ]
        order.servings = expectedServings
        
        order.save()
        
        XCTAssertEqual(spy.savedServings, expectedServings)
    }
    
    //MARK: Helpers
    
    private class EmptyStorageStub: OrderStorage {
        func loadOrder() -> [Serving] {
            return []
        }
        
        func saveOrder(_ order: [Serving]) {}
    }
    
    private class SavedStorageStub: OrderStorage {
        let servings: [Serving]
        
        init(servings: [Serving]) {
            self.servings = servings
        }
        
        func loadOrder() -> [Serving] {
            return servings
        }
        
        func saveOrder(_ order: [Serving]) {}
    }
    
    private class SpyStorage: OrderStorage {
        var savedServings: [Serving] = []
        
        func loadOrder() -> [Serving] {
            return []
        }
        
        func saveOrder(_ order: [Serving]) {
            savedServings = order
        }
    }
}
