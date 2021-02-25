//
//  BookCustomViews.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 9/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TitleText: View {
    var title = ""
    var body: some View {
        Text(title)
            .font(.largeTitle)
    }
    
    init(_ title: String) {
        self.title = title
    }
}

struct SubtitleText: View {
    var subtitle = ""
    var body: some View {
        Text(subtitle)
            .font(.title)
            .foregroundColor(.gray)
    }
    
    init(_ subtitle: String) {
        self.subtitle = subtitle
    }
}

struct BannerText: View {
    var text: String
    var backColor: Color
    var textColor: Color
    
    var body: some View {
        Text(text)
            .font(.title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(backColor)
            .foregroundColor(textColor)
    }
    
    init(_ text: String, backColor: Color = Color.orange, textColor: Color = Color.primary) {
        self.text = text
        self.backColor = backColor
        self.textColor = textColor
    }
}

struct BookCustomViews_Previews: PreviewProvider {
    static var previews: some View {
        BannerText("Test", backColor: .blue, textColor: .white)
    }
}
