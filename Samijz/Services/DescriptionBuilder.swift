//
//  DescriptionBuilder.swift
//  Samijz
//
//  Created by Rory Allen on 27/6/2025.
//

struct DescriptionBuilder {
    static func describe(item: Item,
                         bread: String,
                         cut: String,
                         toasted: Bool,
                         crusts: Bool,
                         sheeze: String,
                         extraSheeze: Bool,
                         sauce: CustomOption,
                         shoog: CustomOption,
                         salt: CustomOption,
                         pie: CustomOption,
                         cookie: CustomOption,
                         cooler: Bool) -> String {
        if item.sangaOptions {
            return buildSangaDescription(
                bread: bread,
                cut: cut,
                isToasted: toasted,
                hasCrusts: crusts,
                sheeze: sheeze,
                hasExtraSheeze: extraSheeze,
                sauce: sauce,
                shoog: shoog
            )
        } else if item.drinkOptions {
            return buildDrinkDescription(hasCooler: cooler)
        } else if item.saltOptions {
            return buildSaltyDescription(salt: salt, sauce: sauce)
        } else if item.pieOptions {
            return buildPieDescription(pie: pie, itemName: item.name, shoog: shoog)
        } else if item.cookieOptions {
            return buildCookieDescription(cookie: cookie, itemName: item.name, shoog: shoog)
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
