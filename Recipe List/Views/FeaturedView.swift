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
                .padding(.bottom, -40)
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
                            .frame(width: geo.size.width - 40, height: geo.size.height - 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading, spacing: 10) {
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("lightRed"))
                        .cornerRadius(15)
                        .frame(height: 100)
                    
                    VStack (spacing: 2) {
                        HStack {
                            Image(systemName: "deskclock")
                            Text("Total time")
                                .font(.headline)
                            Spacer()
                            Text(model.recipes[tabSelectionIndex].totalTime)
                        }
                        .padding(.bottom, 8)
                        
                        HStack {
                            Text("Preparation")
                                .foregroundColor(Color("secondaryTextOnLightRedBg"))
                                .font(.system(size: 14, weight: .light, design: .default))
                                .padding(.leading, 28)
                            Spacer()
                            Text(model.recipes[tabSelectionIndex].prepTime)
                                .font(.system(size: 14, weight: .light, design: .default))
                                .foregroundColor(Color("secondaryTextOnLightRedBg"))
                        }
                        
                        HStack {
                            Text("Cooking")
                                .foregroundColor(Color("secondaryTextOnLightRedBg"))
                                .font(.system(size: 14, weight: .light, design: .default))
                                .padding(.leading, 28)
                            Spacer()
                            Text(model.recipes[tabSelectionIndex].cookTime)
                                .font(.system(size: 14, weight: .light, design: .default))
                                .foregroundColor(Color("secondaryTextOnLightRedBg"))
                        }
                    }
                    .padding()
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("lightGray"))
                        .cornerRadius(15)
                        .frame(height: 58)
                    
                    VStack (spacing: 2) {
                        HStack {
                            Image(systemName: "tag")
                            Text("Tags")
                                .font(.headline)
                            Spacer()
                            RecipeTags(tags: model.recipes[tabSelectionIndex].tags)
                        }
                    }
                    .padding()
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
