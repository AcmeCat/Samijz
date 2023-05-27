//
//  FileManager-DocumentsDirectory.swift
//  Samijz
//
//  Created by Rory Allen on 27/5/2023.
//

import Foundation

extension FileManager {
    static var docmentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
