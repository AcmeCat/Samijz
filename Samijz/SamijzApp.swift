//
//  SamijzApp.swift
//  Samijz
//
//  Created by Rory Allen on 21/5/2023.
//

import SwiftUI

@main
struct SamijzApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
