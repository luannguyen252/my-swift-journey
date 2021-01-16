//
//  Jiggle.swift
//  Chapter06
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct Jiggle: View {
        @State private var jiggle = false
        
        var body: some View {
            Text("Hello World!")
                .scaleEffect(jiggle ? 1.0 : 0.3)
                .animation(
                    Animation.spring()
                    .repeatForever(
                        autoreverses: true
                    )
            )
                .onAppear(){
                    self.jiggle.toggle()
            }
        }
    }

struct Jiggle_Previews: PreviewProvider {
    static var previews: some View {
        Jiggle()
    }
}
