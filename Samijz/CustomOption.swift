//
//  CustomOption.swift
//  Samijz
//
//  Created by Rory Allen on 24/5/2023.
//

import Foundation

struct CustomOption: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let calories: Int
    
    static let none = CustomOption(id: UUID(), name: "None", calories: 0)
}
