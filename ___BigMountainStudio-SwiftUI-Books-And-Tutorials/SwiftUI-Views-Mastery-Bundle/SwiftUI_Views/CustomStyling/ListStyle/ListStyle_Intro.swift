//
//  ListStyle_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ListStyle_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("List Style").font(.largeTitle)
            Text("Introduction").foregroundColor(.gray)
            Text("Lists default to DefaultListStyle which uses the style appropriate for the platform the list is used on.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(.white)
            
            List {
                Text("This is the default list style for iOS.")
                Text("Line Two")
            }
            // This is the default. No need to set it.
            .listStyle(DefaultListStyle())
            
            Text("The GroupedListStyle is also available in iOS.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(.white)
            
            List {
                Text("This is the grouped list style.")
                Text("It adds a gray bar above and below the list.")
            }
            // This is the only other style available in iOS at this time.
            .listStyle(GroupedListStyle())
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct ListStyle_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ListStyle_Intro()
    }
}
