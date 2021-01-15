//
//  HoveringExample.swift
//  RespondingToEvents
//
//  Created by kim sunchul on 2020/05/07.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct HoveringExample: View {
    @State private var overText = false

    var body: some View {
//        Text("Hello, World!")
//            .foregroundColor(overText ? Color.green : Color.red)
//            .onHover { over in
//                self.overText = over
//            }
        
        Text("Tap me!")
               .font(.largeTitle)
               .hoverEffect(.lift)
               .onTapGesture {
                   print("Text tapped")
               }
    }
}

struct HoveringExample_Previews: PreviewProvider {
    static var previews: some View {
        HoveringExample()
    }
}
