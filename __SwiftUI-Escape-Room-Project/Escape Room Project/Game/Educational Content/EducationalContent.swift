//
//  EducationalContent.swift
//  Created by Julian Schiavo on 15/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// The base educational content view, used by clues to provide their own educational content
public struct EducationalContent<Content: View>: View {
    var imageName: String
    var title: String
    var content: Content
    
    init(imageName: String, title: String, @ViewBuilder content: () -> Content) {
        self.imageName = imageName
        self.title = title
        self.content = content()
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            imageView
            titleView
            Spacer()
            content
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
        }
        .foregroundColor(.white)
    }
    
    private var imageView: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 70)
    }
    
    private var titleView: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.heavy)
    }
}
