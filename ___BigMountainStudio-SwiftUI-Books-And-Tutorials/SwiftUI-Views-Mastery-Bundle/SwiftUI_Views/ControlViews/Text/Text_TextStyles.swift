//
//  Text_Styles.swift
//  100Views
//
//  Created by Mark Moeykens on 7/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Text_TextStyles: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Text")
                .font(.largeTitle)
            
            Text("Text Styles")
                .font(.title)
                .foregroundColor(.gray)
            
            Image("Font")
            
            Text("You can add a TextStyle to the Text view by calling .font(Font.<Text Style>).")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .font(.title)
                .minimumScaleFactor(0.8) // Allow text to resize on smaller devices
            Text("Available Text Styles")
                .font(.title)
                .foregroundColor(.gray)
            
            Divider()
            
            Group {
                Text("Font.largeTitle").font(.largeTitle)
                Text("Font.title").font(.title)
                Text("Font.headline").font(.headline)
                Text("Font.subheadline").font(.subheadline)
                Text("Font.body").font(.body)
                Text("Font.callout").font(.callout)
                Text("Font.footnote").font(.footnote)
                Text("Font.caption").font(.caption)
            }
            
        }
    }
}

struct Text_TextStyles_Previews: PreviewProvider {
    static var previews: some View {
        Text_TextStyles()
    }
}
