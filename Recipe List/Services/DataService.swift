//
//  DataService.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 11/03/2021.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // parse local json file
        
        // get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create a data object
            let data = try Data(contentsOf: url)
            
            // decode the data with a json decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add unique id
                for recipe in recipeData {
                    recipe.id = UUID()
                    
                    // add unique id to ingredients
                    for ingredient in recipe.ingredients {
                        ingredient.id = UUID()
                    }
                }
                
                // return recipes
                return recipeData
                
            } catch {
                // error with parsing json
                print(error)
            }
            
        } catch {
            // error with getting data
            print(error)
        }
        
        // if it ever gets here, we return an empty instance of Recipe
        return [Recipe]()
    }
}
