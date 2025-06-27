//
//  FileOrderStorage.swift
//  Samijz
//
//  Created by Rory Allen on 27/6/2025.
//

import Foundation

class FileOrderStorage: OrderStorage {
    private let savePath: URL
    
    init(savePath: URL = FileManager.documentsDirectory.appendingPathComponent("SavedOrder")) {
        self.savePath = savePath
    }
    
    func loadOrder() -> [Serving] {
        do {
            let data = try Data(contentsOf: savePath)
            return try JSONDecoder().decode([Serving].self, from: data)
        } catch {
            return []
        }
    }
    
    func saveOrder(_ order: [Serving]) {
        do {
            let data = try JSONEncoder().encode(order)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
}



