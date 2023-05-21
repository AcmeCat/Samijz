//
//  Sandwich.swift
//  Samijz
//
//  Created by Rory Allen on 21/5/2023.
//

import Foundation

struct Sandwich: Identifiable, Codable {
    let id: UUID
    let name: String
    
    static let example = Sandwich(id: UUID(), name: "Example Sandwich")
}
