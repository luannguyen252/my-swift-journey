//  Created by Mark Moeykens on 6/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.

import SwiftUI

struct Text_LineLimit : View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            
            Text("Line Limit")
                .foregroundColor(.gray)

            Image("LineLimit")
            
            Text("The Text view shows read-only text that can be modified in many ways. It wraps automatically. If you want to limit the text wrapping, add .lineLimit(<number of lines here>).")
                .padding()
                .frame(maxWidth: .infinity, minHeight: 0)
                .background(Color.green)
                .foregroundColor(.white)
            
            Text("Here, I am limiting the text to just one line.")
                .lineLimit(1)
                .padding(.horizontal)
        }
        .font(.title)
    }
}

struct Text_LineLimit_Previews : PreviewProvider {
    static var previews: some View {
        Text_LineLimit()
    }
}
