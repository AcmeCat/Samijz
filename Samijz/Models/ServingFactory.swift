//
//  ServingFactory.swift
//  Samijz
//
//  Created by Rory Allen on 28/6/2025.
//

import Foundation

struct ServingFactory {
    static func make(from request: ServingRequest) -> Serving {
        let description = DescriptionBuilder.describe(request)
        return Serving(id: UUID(),
                       name: request.item.name,
                       description: description,
                       calories: request.calories,
                       cost: request.cost)
    }
}
