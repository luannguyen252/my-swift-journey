//
//  Button-FloatingAction.swift
//  100Views
//
//  Created by Mark Moeykens on 7/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Button_FloatingAction: View {
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Text("Button")
                    .font(.largeTitle)
                
                Text("Floating")
                    .font(.title).foregroundColor(.gray)
                
                Text("You can also create floating buttons by using a ZStack so the button on the top layer, over everything else")
                    .padding().frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .foregroundColor(.white).font(.title)
                Spacer()
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    .padding(20)
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .cornerRadius(.infinity)
                }
                    .padding(.trailing, 30) // Add 30 points on the trailing side of the button
            }
        }
    }
}

struct Button_FloatingAction_Previews: PreviewProvider {
    static var previews: some View {
        Button_FloatingAction()
    }
}
