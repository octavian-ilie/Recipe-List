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
}
