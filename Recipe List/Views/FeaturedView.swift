//
//  FeaturedView.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 14/03/2021.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var recipeTitle = "Featured Recipes"
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
                
                Text("Featured Recipes")
                    .bold()
                    .padding(.leading, 20)
                    .padding(.top, 40)
                    .font(.largeTitle)
                
                GeometryReader { geo in
                    TabView {
                        // loop through each recipe
                        ForEach (0..<model.recipes.count) { index in
                            // only show featured recipes
                            if model.recipes[index].featured {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    ZStack {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .clipped()
                                        VStack {
                                            Spacer()
                                            Text(model.recipes[index].name)
                                                .padding()
                                                .foregroundColor(.white)
                                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                                .shadow(color: .black, radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                        }
                                    }
                                }
                                .frame(width: geo.size.width - 50, height: geo.size.height - 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .cornerRadius(15)
                                .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
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
                            Text("1 hour")
                            Image(systemName: "deskclock")
                        }
                    }
                    HStack {
                        Text("Tags")
                            .font(.headline)
                        Spacer()
                        HStack {
                            Text("Healthy, Hearthy, Easy")
                            Image(systemName: "tag")
                        }
                    }
                }
                .padding([.horizontal, .top], 20)
                .padding(.bottom, 40)
                
            }
        }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(RecipeModel())
    }
}
