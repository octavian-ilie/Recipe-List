//
//  RecipeDetailView.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 11/03/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 260)
                    .clipped()
                    .padding(.vertical, 10)
                
                // MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.system(size: 25, weight: .medium, design: .rounded))
                        .padding(.bottom, 5)
                    ForEach (recipe.ingredients, id: \.self) { ingredient in
                        HStack {
                            Image(systemName: "arrowtriangle.forward.fill")
                            Text(ingredient)
                        }.padding(.top, 0.1)
                    }
                }.padding([.horizontal, .bottom], 15)
                
                Divider()
                
                // MARK: Directions
                VStack (alignment: .leading) {
                    Text("Directions")
                        .font(.system(size: 25, weight: .medium, design: .rounded))
                        .padding(.bottom, 5)
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding(.top, 0.1)
                    }
                }.padding(.horizontal).padding(.top, 10)
            }
        }.navigationTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // dummy recipe to pass to detail view for styling and testing purposes
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
