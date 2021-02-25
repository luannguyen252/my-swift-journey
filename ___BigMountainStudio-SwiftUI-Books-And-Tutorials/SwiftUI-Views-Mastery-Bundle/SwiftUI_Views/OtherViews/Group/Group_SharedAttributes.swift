//
//  Group_Attributes.swift
//  100Views
//
//  Created by Mark Moeykens on 8/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Group_SharedAttributes: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Group")
                .font(.largeTitle)
            
            Text("Shared Attributes")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("You can use a Group to apply a modifier to all its child views.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.blue)
                .foregroundColor(.white)
            
            Group {
                Image(systemName: "leaf.arrow.circlepath")
                    .font(.largeTitle)
                    .padding()
                Text("Please Recycle")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("Notice the difference between these two:")
                .font(.system(size: 22))
            
            VStack {
                Image(systemName: "leaf.arrow.circlepath")
                    .font(.largeTitle)
                    .padding()
                Text("Please Recycle")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("The modifiers are applied to child views in Groups INDIVIDUALLY.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.blue)
                .foregroundColor(.white)
        }
        .minimumScaleFactor(0.5)
    }
}

struct Group_SharedAttributes_Previews: PreviewProvider {
    static var previews: some View {
        Group_SharedAttributes()
    }
}
