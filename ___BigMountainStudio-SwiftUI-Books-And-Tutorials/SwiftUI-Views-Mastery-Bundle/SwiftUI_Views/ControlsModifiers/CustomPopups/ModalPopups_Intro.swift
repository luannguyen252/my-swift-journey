//
//  ModalPopups_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ModalPopups_Intro: View {
    @State private var showingModal = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Custom Popup").font(.largeTitle)
                
                Text("Introduction").font(.title).foregroundColor(.gray)
                
                Text("You can create your own modal popup with the use of a ZStack and a State variable.")
                    .frame(maxWidth: .infinity)
                    .padding().font(.title)
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                
                Button(action: {
                    self.showingModal = true
                }) {
                    Text("Show popup")
                }
                Spacer()
            }
            
            // The Custom Popup is on top of the screen
            if $showingModal.wrappedValue {
                // But it will not show unless this variable is true
                ZStack {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    // This VStack is the popup
                    VStack(spacing: 20) {
                        Text("Popup")
                            .bold().padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                        Spacer()
                        Button(action: {
                            self.showingModal = false
                        }) {
                            Text("Close")
                        }.padding()
                    }
                    .frame(width: 300, height: 200)
                    .background(Color.white)
                    .cornerRadius(20).shadow(radius: 20)
                }
            }
        }
    }
}

struct ModalPopups_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ModalPopups_Intro()
    }
}
