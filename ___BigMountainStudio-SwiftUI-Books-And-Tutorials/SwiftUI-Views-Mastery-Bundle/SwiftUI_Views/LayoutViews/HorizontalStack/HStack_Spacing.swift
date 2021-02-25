//
//  HStack_Spacing.swift
//  100Views
//
//  Created by Mark Moeykens on 7/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HStack_Spacing: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("HStack")
                .font(.largeTitle)
            
            Text("Spacing")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("The HStack initializer allows you to set the spacing between all the views inside the HStack.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange).font(.title)
                .foregroundColor(.black)
            
            Text("Default Spacing")
                .font(.title)
            HStack {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }.font(.largeTitle)
            
            Text("Spacing: 100")
                .font(.title)
            HStack(spacing: 100) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }.font(.largeTitle)
        }
    }
}

struct HStack_Spacing_Previews: PreviewProvider {
    static var previews: some View {
        HStack_Spacing()
    }
}
