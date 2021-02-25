//
//  Text_Weights_Styles.swift
//  100Views
//
//  Created by Mark Moeykens on 9/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Text_Weights_TextStyles: View {
    var body: some View {
        return VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            
            Text("Weight & Text Styles")
                .font(.title)
                .foregroundColor(.gray)
            
            HStack {
                Image("FontWeight")
                Image(systemName: "plus")
                Image("Font")
            }
            
            Text("These weights can be combined with Text Styles.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .font(.title)
                .layoutPriority(1)
            
            Text("Ultralight - Title")
                .fontWeight(.ultraLight)
                .font(.title)
            Text("Thin - Body")
                .fontWeight(.thin)
                .font(.body)
            Text("Light - Large Title")
                .fontWeight(.light)
                .font(.largeTitle)
            Text("Bold - Callout")
                .fontWeight(.bold)
                .font(.callout)
            Text("Black - Title")
                .fontWeight(.black)
                .font(.title)
        }
    }
}

struct Text_Weights_TextStyles_Previews: PreviewProvider {
    static var previews: some View {
        Text_Weights_TextStyles()
    }
}
