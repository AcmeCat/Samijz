//
//  Serving.swift
//  Samijz
//
//  Created by Rory Allen on 27/5/2023.
//

import Foundation

struct Serving: Identifiable, Codable, Equatable {
    var id: UUID
    let name: String
    let description: String
    let calories: Int
    let cost: Int
}
