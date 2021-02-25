//
//  SymbolImageScale_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/16/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct SymbolImageScale_Intro: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Symbol Image Scale").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("Symbol image scale gives you a simple way to adjust the size of symbols with only three choices:")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.green)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Group {
                    Text("Image Scale: Small")
                    Image(systemName: "bolt.fill")
                        .imageScale(.small)
                    
                    Text("Image Scale: Medium")
                    Image(systemName: "bolt.fill")
                        .imageScale(.medium)
                    
                    Text("Image Scale: Large")
                    Image(systemName: "bolt.fill")
                        .imageScale(.large)
                    
                    Text("Change all in one container")
                    HStack(spacing: 60) {
                        Image(systemName: "bolt")
                        Image(systemName: "bolt.fill")
                        Image(systemName: "bolt.slash")
                    }.imageScale(.large)
                }
                .font(.title)
            }
        }
    }
}

struct SymbolImageScale_Intro_Previews: PreviewProvider {
    static var previews: some View {
        SymbolImageScale_Intro()
    }
}
