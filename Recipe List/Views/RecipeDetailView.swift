//
//  RecipeDetailView.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 11/03/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            
            // MARK: Header image with elastic effect
            GeometryReader { geometry in
                VStack {
                    if geometry.frame(in: .global).minY <= 0 {
                        Image(recipe.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            // parallax effect
                            .offset(y: geometry.frame(in: .global).minY/9)
                            .clipped()
                    } else {
                        Image(recipe.image)
                            .resizable()
                            // image starts to zoom in when reaching max size
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                            .clipped()
                            .offset(y: -geometry.frame(in: .global).minY)
                    }
                }
            }
            .frame(height: 260)
            
            // The rest of the content
            VStack (alignment: .leading) {
                
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    .font(.largeTitle)
                
                // MARK: Serving Size Picker
                VStack (alignment: .leading) {
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("1").tag(1)
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: UIScreen.main.bounds.width - 180)
                    .padding(.bottom, 5)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .padding(.bottom, 10)
                
                Divider()
                
                // MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.system(size: 25, weight: .medium, design: .default))
                        .padding(.bottom, 5)
                    ForEach (recipe.ingredients) { ingredient in
                        HStack {
                            Text("• " + RecipeModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + ingredient.name.lowercased())
                        }.padding(.top, 0.1)
                    }
                }
                .padding(.all, 20)
                
                Divider()
                
                // MARK: Directions
                VStack (alignment: .leading) {
                    Text("Directions")
                        .font(.system(size: 25, weight: .medium, design: .default))
                        .padding(.bottom, 5)
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding(.top, 0.1)
                    }
                }
                .padding(.all, 20)
                .padding(.bottom, 20)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // dummy recipe to pass to detail view for styling and testing purposes
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
