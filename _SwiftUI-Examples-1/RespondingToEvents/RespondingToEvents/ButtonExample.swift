//
//  ButtonExample.swift
//  RespondingToEvents
//
//  Created by kim sunchul on 2020/05/01.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct ButtonExample: View {
    @State private var showDetails = false
    
    var body: some View {
//        Button(action: {
//            // your action here
//        }) {
//            Text("Button title")
//        }
//        Button(action: {
//            self.showDetails.toggle()
//        }) {
//            Image("example-image")
//        }
        VStack {
            Button(action: {
                self.showDetails.toggle()
            }) {
                Text("how details")
            }
            
            if showDetails {
                Text("You should follow me on Twitter : @twostaraws")
                    .font(.largeTitle)
            }
        }

    }
}

struct ButtonExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExample()
    }
}
