//
//  Order.swift
//  Samijz
//
//  Created by Rory Allen on 27/5/2023.

import Foundation

protocol OrderStorage {
    func loadOrder() -> [Serving]
    func saveOrder(_ order: [Serving])
}

public class Order: ObservableObject {
    @Published var servings: [Serving]
    private let storage: OrderStorage
    
    init(storage: OrderStorage) {
        self.storage = storage
        servings = storage.loadOrder()
    }
    
    func save() {
        storage.saveOrder(servings)
    }
    
    var currentTotal: Int {
        servings.reduce(0) { $0 + $1.cost }
    }
    
    //TODO: revise this after you modify the data model
    func add(_ item: Item, bread: String, cut: String, toasted: Bool, crusts: Bool, sheeze: String, extraSheeze: Bool, sauce: CustomOption,
             shoog: CustomOption, salt: CustomOption, pie: CustomOption, cookie: CustomOption, cooler: Bool, calories: Int, cost: Int) {
        let description = DescriptionBuilder.describe(item: item, bread: bread, cut: cut, toasted: toasted, crusts: crusts, sheeze: sheeze, extraSheeze: extraSheeze, sauce: sauce, shoog: shoog, salt: salt, pie: pie, cookie: cookie, cooler: cooler)
        let serving = Serving(id: UUID(), name: item.name, description: descriptionString, calories: calories, cost: cost)
        servings.insert(serving, at: 0)
        save()
    }
}
