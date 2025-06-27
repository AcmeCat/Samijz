//
//  ContentView.swift
//  Samijz
//
//  Created by Rory Allen on 21/5/2023.
//

import SwiftUI
import CoreData

class FileOrderStorage: OrderStorage {
    func saveOrder(_ order: [Serving]) {
        
    }
    
    func loadOrder() -> [Serving] {
        return []
    }
}

struct ContentView: View {
    @StateObject var menu = Menu()
    @StateObject var order = Order(storage: FileOrderStorage())
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            VStack {
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
                if !order.servings.isEmpty {
                    Button ("Place Order (Total: $\(order.currentTotal))") {
                        print("Order Placed")
                        order.servings = []
                        order.save()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
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
