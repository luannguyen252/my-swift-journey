//
//  StatusBarHidden_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct StatusBarHidden_Intro: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Status Bar Hidden")
                .font(.largeTitle)
            Text("Introduction")
                .foregroundColor(.gray)
            Text("You use the statusBar modifier to hide or show the status bar on demand for any view.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.pink)
                .foregroundColor(.black)
            
            Toggle(isOn: $isOn) {
                Text("Status Bar Hidden")
                Image(systemName: isOn ? "eye.slash" : "eye")
                    .foregroundColor(.pink)
            }
            .padding()
        }
        .font(.title)
            // Include this modifier anywhere in your view
            .statusBar(hidden: isOn)
    }
}

struct StatusBarHidden_Intro_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarHidden_Intro()
    }
}
