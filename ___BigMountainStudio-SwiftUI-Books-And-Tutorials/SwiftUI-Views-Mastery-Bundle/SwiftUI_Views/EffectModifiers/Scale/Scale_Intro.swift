//
//  Scale_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scale_Intro: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Scale Effect").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("Scale views to make them bigger or smaller.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.pink)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Group {
                    Text("Before")
                    Text("Scale This")
                        .font(.title)
                    
                    Text("After (3X)")
                    Text("Scale This")
                        .font(.title)
                        .scaleEffect(3)
                    
                    Divider().padding(.top)
                    Text("Before")
                    Image("yosemite")
                    
                    Text("After (1.6X)")
                    Image("yosemite")
                        .scaleEffect(1.6)
                    
                    Text("(Note: Scaling by 1 has no effect)")
                        .font(.title)
                        .padding(.top)
                }
            }
        }
    }
}

struct Scale_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Scale_Intro()
    }
}
