//
//  SectionView.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import SwiftUI

// MARK:- Section View
struct SectionView<Content>: View where Content: View {
    // MARK: Properties
    private let title: String?
    private let content: () -> Content
    
    // MARK: Initializers
    init(title: String? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
}

// MARK:- Body
extension SectionView {
    var body: some View {
        VStack(content: {
            if title != nil {
                Text(title ?? "")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            
            VStack(alignment: .leading, content: content)
                .frame(maxWidth: .infinity, alignment: .leading)
        })
            .padding(20)
            .frame(alignment: .top)
            
            .background(background)
    }
    
    var background: some View {
        Rectangle()
            .cornerRadius(20)
        
            .foregroundColor(.formBackground)
    }
}

// MARK:- Preview
struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(title: "Special Words", content: {
            ForEach(SpecialWord.allCases, content: { specialWord in
                CheckBoxView(isOn: .constant(true), specialWord: specialWord)
            })
        })
            .frame(width: 300, height: 300)
    }
}
