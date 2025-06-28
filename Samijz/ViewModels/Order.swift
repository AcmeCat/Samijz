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
    
    func add(_ request: ServingRequest) {
        let serving = ServingFactory.make(from: request)
        servings.insert(serving, at: 0)
        save()
    }
}
