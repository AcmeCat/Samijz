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
    @StateObject var order = Order()
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                if order.servings.isEmpty {
                    Button("Add your first item") {
                        showingAddScreen = true
                    }
                } else {
                    ForEach(order.servings) {serving in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(serving.name)
                                    .font(.headline)
                                Text(serving.description)
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            Text("\(serving.calories) kCal")
                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen, content: MenuView.init)
            .navigationTitle("Samijz")
            .toolbar {
                Button {
                    showingAddScreen = true
                } label: {
                    Label("Add New Item", systemImage: "plus")
                }
            }
        }
        .environmentObject(menu)
        .environmentObject(order)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
