//
//  RecipeModel.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 11/03/2021.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            // get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // reduce fraction by the greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // get the whole portion if numerator > denominator
            if numerator >= denominator {
                // whole portions
                wholePortions = numerator / denominator
                // the remainder
                numerator = numerator % denominator
                // assign to portion string
                portion += String(wholePortions)
            }
            
            // express the remainder as a fraction
            if numerator > 0 {
                // assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
        }
        
        if var unit = ingredient.unit {
            
            // calculate appropiate suffix
            if wholePortions > 1 {
                // checking the last 2 characters from the string
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    }
}
