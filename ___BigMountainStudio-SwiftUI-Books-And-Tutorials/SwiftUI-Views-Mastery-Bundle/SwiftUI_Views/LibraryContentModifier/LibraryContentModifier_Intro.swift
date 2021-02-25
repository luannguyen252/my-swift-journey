//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LibraryContentModifier_Intro: View {
    var body: some View {
        VStack {
            Text("Try your new library item")
            TitleView(titleText: "Hello!")
            Image("profile")
                .resizedToFill(width: 100, height: 100)
        }
    }
}

struct LibraryContentModifier_Intro_Previews: PreviewProvider {
    static var previews: some View {
        LibraryContentModifier_Intro()
    }
}


struct TitleView: View {
    var titleText: String
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.black)
    }
}


extension Image {
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
    }
}

struct LibraryContent: LibraryContentProvider {
    // Adding views
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(TitleView(titleText: "Insert Title Here"),
                    title: "My Title View")
//                    ,
//                    category: LibraryItem.Category.control)
        
        // Add more library items here...
    }
    
    // Adding modifiers
    @LibraryContentBuilder
    func modifiers(base: Image) -> [LibraryItem] {
        LibraryItem(
            base.resizedToFill(width: 100, height: 100)
//            , category: LibraryItem.Category.effect
        )
    }
}
