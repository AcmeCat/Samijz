//
//  CustomiseView.swift
//  Samijz
//
//  Created by Rory Allen on 22/5/2023.
//

import SwiftUI

struct CustomiseView: View {
    let item: Item
    
    @EnvironmentObject var menu: Menu
    
    @State private var bread = 0
    @State private var isToasted = true
    @State private var extraSheeze = false
    @State private var hasCrust = true
    @State private var cuts = 0
    @State private var sheeze = 0
    @State private var sauce = CustomOption.none
    
    let breadOptions = ["White", "Whole", "Grainy", "Gluten-free"]
    
    let cutOptions = ["Uncut", "2 Triangles", "4 Triangles", "2 Rectangles", "3 Rectangles", "4 Squares"]
    
    let sheezeOptions = ["None (Heretic)", "Sharp", "Tasty", "Melty", "House Mix"]
    
    var calories: Int {
        100
    }
    
    var body: some View {
        Form {
            if item.sangaOptions {
                Section("Bread Options") {
                    Picker("Bread", selection: $bread) {
                        ForEach(breadOptions.indices, id: \.self) { index in
                            Text(breadOptions[index])
                        }
                    }
                    .pickerStyle(.segmented)
                    Toggle("Toasted", isOn: $isToasted)
                    Picker("Cuts", selection: $cuts) {
                        ForEach(cutOptions.indices, id: \.self) { index in
                            Text(cutOptions[index])
                        }
                    }
                    .pickerStyle(.segmented)
                    Toggle("Crusts", isOn: $hasCrust)
                }
                Section("Sheeze Options") {
                    Picker("Sheeze", selection: $sheeze) {
                        ForEach(sheezeOptions.indices, id: \.self) { index in
                            Text(sheezeOptions[index])
                        }
                    }
                    .pickerStyle(.segmented)
                    Toggle("Extra Sheeze", isOn: $extraSheeze)
                }
            }
            if item.sauceOptions {
                Section("Sauce Options"){
                    Picker("Sauce", selection: $sauce) {
                        ForEach(menu.sauceOptions) { option in
                            Text(option.name)
                                .tag(option)
                        }
                    }
                }
            }
            Section ("Estimates") {
                Text("**Calories:** \(calories) kcal")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(item.name)
    }
}

struct CustomiseView_Previews: PreviewProvider {
    static var previews: some View {
        CustomiseView(item: Item.example)
            .environmentObject(Menu())
    }
}
