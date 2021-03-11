//
//  ContentView.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 08/03/2021.
//

import SwiftUI

struct RecipeListView: View {
    
    // reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { element in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: element),
                    label: {
                        // MARK: Row item
                        HStack(spacing: 15) {
                            Image(element.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .cornerRadius(5)
                            Text(element.name)
                        }.padding(.top, 5).padding(.bottom, 5)
                    })
            }.navigationTitle(Text("Recipes"))
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
