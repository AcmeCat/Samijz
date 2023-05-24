//
//  Sandwich.swift
//  Samijz
//
//  Created by Rory Allen on 21/5/2023.
//

import Foundation

struct Item: Identifiable, Codable {
    let id: UUID
    let name: String
    let sangaOptions: Bool
    let saltOptions: Bool
    let sauceOptions: Bool
    let shoogOptions: Bool
    let drinkOptions: Bool
    let pieOptions: Bool
    let cookieOptions: Bool
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    static let example = Item(id: UUID(), name: "Example Item", sangaOptions: true, saltOptions: true, sauceOptions: true, shoogOptions: true, drinkOptions: true, pieOptions: true, cookieOptions: true)
}
