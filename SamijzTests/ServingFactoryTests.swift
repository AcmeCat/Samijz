//
//  ServingFactoryTests.swift
//  SamijzTests
//
//  Created by Rory Allen on 28/6/2025.
//

import XCTest

final class ServingFactoryTests: XCTestCase {

    func test_makeServingFromSangaRequest_buildsCorrectDescription() {
        let item = Item(id: UUID(), name: "Veggie Delight", sangaOptions: true, saltOptions: true, sauceOptions: true, shoogOptions: true, drinkOptions: true, pieOptions: true, cookieOptions: true, cost: 10, calories: 100)
        let request = ServingRequest(
            item: item,
            bread: "Multigrain",
            cut: "Triangles",
            toasted: true,
            crusts: false,
            sheeze: "Cheddar",
            extraSheeze: true,
            sauce: CustomOption(id: UUID(), name: "BBQ", calories: 68),
            shoog: CustomOption(id: UUID(), name: "Vanilla", calories: 77),
            salt: .none,
            pie: .none,
            cookie: .none,
            cooler: false,
            calories: 420,
            cost: 9
        )
        
        let serving = ServingFactory.make(from: request)
        
        XCTAssertEqual(serving.name, "Veggie Delight")
        XCTAssertEqual(serving.description, "Toasted, on multigrain bread, with extra cheddar sheeze, with vanilla shoog, and bbq sauce, cut into triangles, and no crusts")
    }
    
    func test_makeServingfromDrinkRequest_addsCoolerLine() {
        let item = Item(id: UUID(), name: "A Drink", sangaOptions: false, saltOptions: true, sauceOptions: false, shoogOptions: false, drinkOptions: true, pieOptions: false, cookieOptions: false, cost: 10, calories: 100)
        let request = ServingRequest(
            item: item,
            bread: "",
            cut: "",
            toasted: false,
            crusts: true,
            sheeze: "",
            extraSheeze: false,
            sauce: .none,
            shoog: .none,
            salt: .none,
            pie: .none,
            cookie: .none,
            cooler: true,
            calories: 150,
            cost: 5
        )
        
        let serving = ServingFactory.make(from: request)
        
        XCTAssertTrue(serving.description.contains("party clothes"))
    }
    
    func test_makeServingFromSaltyRequest_includesFormattedSaltAndSauce() {
        let item = Item(id: UUID(), name: "Chippies", sangaOptions: false, saltOptions: true, sauceOptions: true, shoogOptions: false, drinkOptions: false, pieOptions: false, cookieOptions: false, cost: 10, calories: 100)
        let request = ServingRequest(
            item: item,
            bread: "",
            cut: "",
            toasted: false,
            crusts: true,
            sheeze: "",
            extraSheeze: false,
            sauce: CustomOption(id: UUID(), name: "Tomato", calories: 123),
            shoog: .none,
            salt: CustomOption(id: UUID(), name: "Chicken", calories: 2),
            pie: .none,
            cookie: .none,
            cooler: false,
            calories: 300,
            cost: 6
        )
        
        let serving = ServingFactory.make(from: request)
        
        XCTAssertTrue(serving.description.contains("chicken salt"))
        XCTAssertTrue(serving.description.contains("tomato sauce"))
    }
}
