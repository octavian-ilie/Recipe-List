//
//  ContentView.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 08/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    var array = ["Recipe 1", "Recipe 2", "Recipe 3", "Recipe 4", "Recipe 5"]
    
    var body: some View {
        
        NavigationView {
            List(array, id: \.self) { element in
                NavigationLink(
                    destination: Text("View for \(element)."),
                    label: {
                        Text(element)
                    })
            }.navigationTitle(Text("Recipes"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
