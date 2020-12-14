//
//  Home.swift
//  MyFirstAppClips
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct Home: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            Text("Hello, I'm an App Clips!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.black)
        }
    }
}

// MARK: - PREVIEW
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
