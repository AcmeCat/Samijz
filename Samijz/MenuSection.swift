//
//  MenuSection.swift
//  Samijz
//
//  Created by Rory Allen on 21/5/2023.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name: String
    let items: [Item]
}
