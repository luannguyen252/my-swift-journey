//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Image_FromSymbolsWithColor: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Image",
                       subtitle: "Multicolor Symbols",
                       desc: "Some SF Symbols have more than one color that you can enable by using the renderingMode modifier.",
                       back: .red, textColor: .primary)
            
            Image(systemName: "note.text.badge.plus")
                .renderingMode(.original)
                .font(.largeTitle)
            
            Text("If used in a Button, change the color with the accentColor modifier:")
            
            Button(action: {}, label: {
                Image(systemName: "note.text.badge.plus")
                    .renderingMode(.original)
                    .accentColor(.red)
                    .font(.largeTitle)
            })
            
            Text("Or use foregroundColor:")
            Image(systemName: "note.text.badge.plus")
                .renderingMode(.original)
                .foregroundColor(.purple)
                .font(.largeTitle)
        }
        .font(.title)
    }
}

struct Image_FromSymbolsWithColor_Previews: PreviewProvider {
    static var previews: some View {
        Image_FromSymbolsWithColor()
    }
}
