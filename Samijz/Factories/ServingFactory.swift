//
//  ServingFactory.swift
//  Samijz
//
//  Created by Rory Allen on 28/6/2025.
//

import Foundation

struct ServingFactory {
    static func make(from request: ServingRequest) -> Serving {
        let description = DescriptionBuilder.describe(request)
        return Serving(id: UUID(),
                       name: request.item.name,
                       description: description,
                       calories: request.calories,
                       cost: request.cost)
    }
    
    // MARK: - Private DescriptionBuilder
    
    private struct DescriptionBuilder {
        static func describe(_ request: ServingRequest) -> String {
            if request.item.sangaOptions {
                return buildSangaDescription(
                    bread: request.bread,
                    cut: request.cut,
                    isToasted: request.toasted,
                    hasCrusts: request.crusts,
                    sheeze: request.sheeze,
                    hasExtraSheeze: request.extraSheeze,
                    sauce: request.sauce,
                    shoog: request.shoog
                )
            } else if request.item.drinkOptions {
                return buildDrinkDescription(hasCooler: request.cooler)
            } else if request.item.saltOptions {
                return buildSaltyDescription(salt: request.salt, sauce: request.sauce)
            } else if request.item.pieOptions {
                return buildPieDescription(pie: request.pie, itemName: request.item.name, shoog: request.shoog)
            } else if request.item.cookieOptions {
                return buildCookieDescription(cookie: request.cookie, itemName: request.item.name, shoog: request.shoog)
            } else {
                return ""
            }
        }
            
        private static func buildSangaDescription(bread: String,
                                                  cut: String,
                                                  isToasted: Bool,
                                                  hasCrusts: Bool,
                                                  sheeze: String,
                                                  hasExtraSheeze: Bool,
                                                  sauce: CustomOption,
                                                  shoog: CustomOption) -> String {
            var descriptionParts = [String]()
            descriptionParts.append("\(cut != "Uncut" ? !isToasted ? "O" : "Toasted, o" : !isToasted ? "Uncut, o" : "Toasted, uncut, o")n \(bread.lowercased()) bread")
            if (sheeze != "None (Heretic)") { descriptionParts.append("with \(hasExtraSheeze ? "extra " : "")\(sheeze.lowercased()) sheeze")}
            if (shoog != .none) { descriptionParts.append("with \(shoog.name.lowercased()) shoog")}
            descriptionParts.append("and \(sauce == .none ? "no" : sauce.name.lowercased()) sauce")
            if (cut != "Uncut") {descriptionParts.append("cut into \(cut.lowercased())")}
            if !hasCrusts { descriptionParts.append("and no crusts") }
            return descriptionParts.joined(separator: ", ")
        }
        
        private static func buildDrinkDescription(hasCooler: Bool) -> String {
            return hasCooler ? "With party clothes included" : ""
        }
        
        private static func buildSaltyDescription(salt: CustomOption, sauce: CustomOption) -> String {
            var descriptionParts = [String]()
            if (salt != .none) { descriptionParts.append("With \(salt.name.lowercased()) salt")}
            descriptionParts.append("and \(sauce == .none ? "no" : sauce.name.lowercased()) sauce")
            return descriptionParts.joined(separator: ", ")
        }
        
        private static func buildPieDescription(pie: CustomOption, itemName: String, shoog: CustomOption) -> String {
            var descriptionParts = [String]()
            descriptionParts.append("\(itemName.prefix(1).capitalized + itemName.dropFirst().lowercased())")
            if (shoog != .none) { descriptionParts.append("with \(shoog.name.lowercased()) shoog")}
            return descriptionParts.joined(separator: ", ")
        }
        
        private static func buildCookieDescription(cookie: CustomOption, itemName: String, shoog: CustomOption) -> String {
            var descriptionParts = [String]()
            descriptionParts.append("\(itemName.prefix(1).capitalized + itemName.dropFirst().lowercased())")
            if (shoog != .none) { descriptionParts.append("with \(shoog.name.lowercased()) shoog")}
            return descriptionParts.joined(separator: ", ")
        }
    }

}
