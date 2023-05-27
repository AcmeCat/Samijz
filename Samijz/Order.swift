//
//  Order.swift
//  Samijz
//
//  Created by Rory Allen on 27/5/2023.
//  Adapted from Paul Hudson's video at https://www.youtube.com/watch?v=tSwDfV6D_70

import Foundation

class Order: ObservableObject {
    @Published var servings: [Serving]
    let savePath = FileManager.docmentsDirectory.appendingPathComponent("SavedOrder")
    
    init() {
        do { //load data from docuemnts path
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
    
    //revise this after you modify the data model
    func add(_ item: Item, bread: String, cut: String, toasted: Bool, crusts: Bool, sheeze: String, extraSheeze: Bool, sauce: CustomOption,
             shoog: CustomOption, salt: CustomOption, pie: CustomOption, cookie: CustomOption, cooler: Bool, calories: Int, cost: Int) {
        var description = [String]()
        if item.sangaOptions {
            description.append("\(cut == "Uncut " ? cut : "")\(toasted ? "Toasted " : "") \(item.name) Samij")
            description.append("on \(bread) bread")
            if (sheeze != "none (heretic)") { description.append("with \(extraSheeze ? "extra " : "")\(sheeze) sheeze")}
            if (shoog != CustomOption.none) { description.append("with \(shoog.name) shoog")}
            description.append("and \(sauce == CustomOption.none ? "no" : sauce.name) sauce")
            if (cut != "Uncut") {description.append("cut into \(cut)")}
            if !crusts { description.append("and no crusts") }
        } else if item.drinkOptions {
            description.append(item.name)
            if cooler { description.append(" with party clothes") }
        } else if item.saltOptions {
            description.append(item.name)
            if (salt != CustomOption.none) { description.append("with \(salt.name) salt")}
            description.append("and \(sauce == CustomOption.none ? "no" : sauce.name) sauce")
        } else if item.pieOptions {
            description.append("\(pie.name) \(item.name)")
            if (shoog != CustomOption.none) { description.append("with \(shoog.name) shoog")}
        } else if item.cookieOptions {
            description.append("\(cookie.name) \(item.name)")
            if (shoog != CustomOption.none) { description.append("with \(shoog.name) shoog")}
        }
        let descriptionString = description.joined(separator: ", ")
        
        let serving = Serving(id: UUID(), name: item.name, description: descriptionString, calories: calories, cost: cost)
        servings.insert(serving, at: 0)
        save()
    }
}
