//
//  Shadow_OrderMatters.swift
//  100Views
//
//  Created by Mark Moeykens on 9/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Shadow_OrderMatters: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Shadow").font(.largeTitle)
                Text("Order Matters").font(.title).foregroundColor(.gray)
                Text("Like other modifiers, the order in which you apply it matters.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.blue)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Group {
                    Capsule()
                        .foregroundColor(.blue)
                        .shadow(color: .black, radius: 10)
                        .overlay(Text("Just Shape").foregroundColor(.white))
                        .frame(minHeight: 44)
                    
                    Capsule()
                        .foregroundColor(.blue)
                        .overlay(Text("Shapes & Overlay").foregroundColor(.white))
                        .shadow(color: .black, radius: 10)
                    .frame(minHeight: 50)
                    
                    Button(action: {}) {
                        Text("Just Outline")
                    }
                    .padding()
                    .background(Capsule()
                    .stroke(Color.blue, lineWidth: 2)
                    .shadow(color: .black, radius: 5))
                    
                    Button(action: {}) {
                        Text("Just Text")
                            .shadow(color: .black, radius: 5)
                    }
                    .padding()
                    .background(Capsule().stroke(Color.blue, lineWidth: 2))
                    
                    Button(action: {}) {
                        Text("Outline & Text")
                    }
                    .padding()
                    .background(Capsule().stroke(Color.blue, lineWidth: 2))
                    .shadow(color: .black, radius: 10)
                }
                .padding()
                .font(.title)
            }
        }
    }
}

struct Shadow_OrderMatters_Previews: PreviewProvider {
    static var previews: some View {
        Shadow_OrderMatters()
    }
}
