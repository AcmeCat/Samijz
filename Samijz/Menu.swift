//
//  Menu.swift
//  Samijz
//
//  Created by Rory Allen on 21/5/2023.
//

import Foundation

class Menu: ObservableObject, Codable {
    let sections: [MenuSection]
    
    init() {
        do {
            let url = Bundle.main.url(forResource: "menu", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let menuData = try JSONDecoder().decode(Menu.self, from: data)
            sections = menuData.sections
        } catch {
            fatalError("menu.json is missing or corrupt.")
        }
    }
}