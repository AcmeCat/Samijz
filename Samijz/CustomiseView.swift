//
//  CustomiseView.swift
//  Samijz
//
//  Created by Rory Allen on 22/5/2023.
//

import SwiftUI

struct CustomiseView: View {
    let sandwich: Sandwich
    
    @State private var bread = 0
    @State private var addDrink = false
    
    let breadOptions = ["White", "Whole", "Grainy", "Gluten-free"]
    
    var calories: Int {
        100
    }
    
    var protein: Int {
        15
    }
    
    var body: some View {
        Form {
            Section("Basic options") {
                Picker("Bread", selection: $bread) {
                    ForEach(breadOptions.indices) { index in
                        Text(breadOptions[index])
                    }
                }
                .pickerStyle(.segmented)
                
                Toggle("Add Drink", isOn: $addDrink)
            }
            Section ("Estimates") {
                Text("**Calories:** \(calories) kcal")
                Text("**Protein:** \(protein) grams")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(sandwich.name)
    }
}

struct CustomiseView_Previews: PreviewProvider {
    static var previews: some View {
        CustomiseView(sandwich: Sandwich.example)
    }
}
