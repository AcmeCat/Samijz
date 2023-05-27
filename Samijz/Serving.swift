//
//  Serving.swift
//  Samijz
//
//  Created by Rory Allen on 27/5/2023.
//

import Foundation

struct Serving: Identifiable, Codable {
    var id: UUID //allows reorder of item
    let name: String
    let description: String
    let calories: Int
    let cost: Int
}
