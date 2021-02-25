//
//  Text_Combining.swift
//  100Views
//
//  Created by Mark Moeykens on 6/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Text_CombiningModifiedText : View {
    var body: some View {
        VStack(spacing: 18) {
            Text("Text")
                .font(.largeTitle)
            Text("Combining Text Views")
                .font(.title)
                .foregroundColor(.gray)
            
            HStack {
                Image("Text")
                Image(systemName: "plus").font(.title)
                Image("Text")
            }
            Group {
                Text("You can ")
                    + Text("format").bold()
                    + Text (" different parts of your text by using the plus (+) symbol.")
            }
            .frame(maxWidth: .infinity).padding()
            .foregroundColor(.white).background(Color.green)
            .font(.title)
            
            Group {
                Text("Here is another ")
                    + Text("example").foregroundColor(.red).underline()
                    + Text (" of how you might accomplish this. ")
                    + Text("Notice").foregroundColor(.purple).bold()
                    + Text (" the use of the Group view to add padding and line limit to all the text ")
                    + Text("as a whole.").bold().italic()
            }
            .font(.title)
            .padding(.horizontal)
            
            Group {
                Text("You can also ").font(.title).fontWeight(.light)
                    + Text("combine")
                    + Text(" different font weights ").fontWeight(.black)
                    + Text("and different text styles!").font(.title).fontWeight(.ultraLight)
            }
            .padding(.horizontal)
        }
    }
}

struct Text_CombiningModifiedText_Previews : PreviewProvider {
    static var previews: some View {
        Text_CombiningModifiedText()
    }
}
