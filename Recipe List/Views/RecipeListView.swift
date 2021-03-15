//
//  ContentView.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 08/03/2021.
//

import SwiftUI

struct RecipeListView: View {
    
    // populate model with data from the instance of RecipeModel passed to the RecipeTabView
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        NavigationView {
            
            VStack (alignment: .leading) {
                
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) { element in
                            
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
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.red)
                                    }.padding(.top, 5).padding(.bottom, 5)
                                })
                        }
                    }
                }
                
            }
            .navigationBarHidden(true)
            .padding(.horizontal, 20)
            
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
