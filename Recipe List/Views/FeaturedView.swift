//
//  FeaturedView.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 14/03/2021.
//

import SwiftUI

struct FeaturedView: View {
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        }
    
    @EnvironmentObject var model: RecipeModel
    
    @State var recipeTitle = "Featured Recipes"
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
                
            Text(model.recipes[tabSelectionIndex].name)
                .bold()
                .padding(.leading, 20)
                .padding(.top, 40)
                .font(.largeTitle)
                
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex) {
                    // loop through each recipe
                    ForEach (0..<model.recipes.count) { index in
                        // only show featured recipes
                        if model.recipes[index].featured {
                            
                            // recipe card button
                            Button(action: {
                                
                                // show the recipe detail sheet
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .clipped()
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                // show the recipe detail view
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 50, height: geo.size.height - 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(color: .gray, radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading, spacing: 10) {
                
                HStack {
                    Text("Preparation time")
                        .font(.headline)
                    Spacer()
                    HStack {
                        Text(model.recipes[tabSelectionIndex].prepTime)
                        Image(systemName: "deskclock")
                    }
                }
                
                HStack {
                    Text("Cooking time")
                        .font(.headline)
                    Spacer()
                    HStack {
                        Text(model.recipes[tabSelectionIndex].cookTime)
                        Image(systemName: "deskclock")
                    }
                }
                
                HStack {
                    Text("Tags")
                        .font(.headline)
                    Spacer()
                    HStack {
                        RecipeTags(tags: model.recipes[tabSelectionIndex].tags)
                        Image(systemName: "tag")
                    }
                }
                
            }
            .padding([.horizontal, .top], 20)
            .padding(.bottom, 40)
            
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    
    func setFeaturedIndex() {
        // find the index of first recipe that is featured
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(RecipeModel())
    }
}
