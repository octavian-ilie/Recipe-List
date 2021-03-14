//
//  Ingredient.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 14/03/2021.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
    
}
