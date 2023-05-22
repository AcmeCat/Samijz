//
//  ContentView.swift
//  Samijz
//
//  Created by Rory Allen on 21/5/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var menu = Menu()
    
    var body: some View {
        MenuView()
            .environmentObject(Menu())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
