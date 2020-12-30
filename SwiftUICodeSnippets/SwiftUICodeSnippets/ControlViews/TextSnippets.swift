//
//  TextSnippets.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct TextSnippets: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Text Snippets")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Other Snippet")
                .font(.title)
            
            CustomFonts()
            
            Text("Font Default")
                .font(.system(size: 24, weight: .bold, design: .default))
            
            Text("Font Monospaced")
                .font(.system(size: 24, weight: .bold, design: .monospaced))
            
            Text("Font Rounded")
                .font(.system(size: 24, weight: .bold, design: .rounded))
            
            Text("Font Serif")
                .font(.system(size: 24, weight: .bold, design: .serif))
            
            Text("With Background")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("AccentColor"))
            
            Spacer()
        }
    }
}

#if DEBUG
struct TextSnippets_Previews: PreviewProvider {
    static var previews: some View {
        TextSnippets()
    }
}
#endif

// MARK: - CUSTOM FONTS
struct CustomFonts: View {
    var body: some View {
        Text("Merriweather Black")
            .font(.custom("Merriweather-Black", size: 24))
        
        Text("Merriweather BlackItalic")
            .font(.custom("Merriweather-BlackItalic", size: 24))
        
        Text("Merriweather Bold")
            .font(.custom("Merriweather-Bold", size: 24))
        
        Text("Merriweather BoldItalic")
            .font(.custom("Merriweather-BoldItalic", size: 24))
        
        Text("Merriweather Italic")
            .font(.custom("Merriweather-Italic", size: 24))
        
        Text("Merriweather Light")
            .font(.custom("Merriweather-Light", size: 24))
        
        Text("Merriweather LightItalic")
            .font(.custom("Merriweather-LightItalic", size: 24))
        
        Text("Merriweather Regular")
            .font(.custom("Merriweather-Regular", size: 24))
    }
}
