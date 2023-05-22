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
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    static let example = Sandwich(id: UUID(), name: "Example Sandwich")
}
