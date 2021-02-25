//
//  Group_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Group_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Group")
                .font(.largeTitle)
            
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("A Group view can be used to compose a view with more than ten (10) child views.")
                .frame(maxWidth: .infinity)
                .padding().font(.title).layoutPriority(1)
                .background(Color.blue).foregroundColor(Color.white)
            
            Text("View 4")
            Text("View 5")
            Text("View 6")
            Text("View 7")
            Text("View 8")
            Text("View 9")
            Group { // 10th View
                Text("Child View 1 (Inside Group)")
                Text("Child View 2 (Inside Group)")
            }
        }
    }
}

struct Group_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Group_Intro()
    }
}
