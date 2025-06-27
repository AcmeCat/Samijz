//
//  Order.swift
//  Samijz
//
//  Created by Rory Allen on 27/5/2023.

import Foundation

class Order: ObservableObject {
    @Published var servings: [Serving]
    let savePath = FileManager.docmentsDirectory.appendingPathComponent("SavedOrder")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            servings = try JSONDecoder().decode([Serving].self, from: data)
        } catch {
            servings = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(servings)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    var currentTotal: Int {
        servings.reduce(0) { $0 + $1.cost }
    }
    
    //TODO: revise this after you modify the data model
    func add(_ item: Item, bread: String, cut: String, toasted: Bool, crusts: Bool, sheeze: String, extraSheeze: Bool, sauce: CustomOption,
             shoog: CustomOption, salt: CustomOption, pie: CustomOption, cookie: CustomOption, cooler: Bool, calories: Int, cost: Int) {
        var description = [String]()
        if item.sangaOptions {
            description.append("\(cut != "Uncut" ? !toasted ? "O" : "Toasted, o" : !toasted ? "Uncut, o" : "Toasted, uncut, o")n \(bread.lowercased()) bread")
            if (sheeze != "None (Heretic)") { description.append("with \(extraSheeze ? "extra " : "")\(sheeze.lowercased()) sheeze")}
            if (shoog != CustomOption.none) { description.append("with \(shoog.name.lowercased()) shoog")}
            description.append("and \(sauce == CustomOption.none ? "no" : sauce.name.lowercased()) sauce")
            if (cut != "Uncut") {description.append("cut into \(cut.lowercased())")}
            if !crusts { description.append("and no crusts") }
        } else if item.drinkOptions {
            if cooler { description.append("With party clothes included") }
        } else if item.saltOptions {
            if (salt != CustomOption.none) { description.append("With \(salt.name.lowercased()) salt")}
            description.append("and \(sauce == CustomOption.none ? "no" : sauce.name.lowercased()) sauce")
        } else if item.pieOptions {
            description.append("\(pie.name.prefix(1).capitalized + pie.name.dropFirst().lowercased()) \(item.name.lowercased())")
            if (shoog != CustomOption.none) { description.append("with \(shoog.name.lowercased()) shoog")}
        } else if item.cookieOptions {
            description.append("\(cookie.name.prefix(1).capitalized + cookie.name.dropFirst().lowercased()) \(item.name.lowercased())")
            if (shoog != CustomOption.none) { description.append("with \(shoog.name.lowercased()) shoog")}
        }
        let descriptionString = description.joined(separator: ", ")
        
        let serving = Serving(id: UUID(), name: item.name, description: descriptionString, calories: calories, cost: cost)
        servings.insert(serving, at: 0)
        save()
    }
}
