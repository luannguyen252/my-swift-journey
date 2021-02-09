//
//  SectionView.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import SwiftUI

// MARK:- Form View
struct SectionView<Content>: View where Content: View {
    // MARK: Properties
    private var content: () -> Content
    
    // MARK: Initializers
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
}

// MARK:- Body
extension SectionView {
    var body: some View {
        Form(content: content)
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            .background(background)
    }
    
    var background: some View {
        Rectangle()
            .cornerRadius(20)
        
            .foregroundColor(.formBackground)
    }
}

// MARK:- Preview
struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(content: {
            ForEach(Characters.allCases, content: { characters in
                CheckBoxView(isOn: .constant(true), characters: characters)
            })
        })
            .frame(width: 300, height: 300)
    }
}
