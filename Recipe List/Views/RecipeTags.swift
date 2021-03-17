//
//  RecipeTags.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 17/03/2021.
//

import SwiftUI

struct RecipeTags: View {
    
    var allTags = ""
    
    init(tags: [String]) {
        
        // loop through the tags and build the string
        for index in 0..<tags.count {
            
            // if this is the last item, don't add a comma
            if index == tags.count - 1 {
                allTags += tags[index]
            } else {
                allTags += tags[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allTags)
    }
}

struct RecipeTags_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTags(tags: ["test", "test 2", "test 3"])
    }
}
