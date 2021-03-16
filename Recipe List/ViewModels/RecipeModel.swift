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
        // get a single serving size by multiplying denominator by the recipe servings
        
        // get target portion by multiplying numerator by target servings
        
        // reduce fraction by the greatest common divisor
        
        // get the whole portion if numerator > denominator
        
        // express the remainder as a fraction
        
        return String(targetServings)
    }
}
