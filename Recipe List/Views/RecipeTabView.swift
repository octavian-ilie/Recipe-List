//
//  RecipeTabView.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 14/03/2021.
//

import SwiftUI

struct RecipeTabView: View {
    
    // make app start with Recipes tab by default
    @State var tabIndex = 2
    
    var body: some View {
        TabView (selection: $tabIndex) {
            
            //MARK: Featured
            FeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }.tag(1)
            
            // MARK: Recipe List
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Recipes")
                    }
                }.tag(2)
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
