//
//  Testing.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Testing: View {
    @State private var showMessage = false
    
    var body: some View {
        ZStack {
            // Remove this background color and it works as expected
            Color(UIColor.systemGray5).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Button(action: {
                    self.showMessage.toggle()
                }) {
                    Text("SHOW MESSAGE")
                }
            }
            
            if showMessage {
                Text("HELLO WORLD!")
                    .font(.largeTitle)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.pink))
                    .opacity(showMessage ? 1 : 0)
            }
        }.animation(.easeOut(duration: 1))
    }
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}
