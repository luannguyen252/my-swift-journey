//
//  List_WithStaticData.swift
//  100Views
//
//  Created by Mark Moeykens on 9/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct List_WithStaticData: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("List").font(.largeTitle)
            Text("Static Data").font(.title).foregroundColor(.gray)
            Text("You can show static views or data within the List view. It does not have to be bound with data. It gives you a scrollable view.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.green)
                .foregroundColor(.black)
            
            List {
                Text("Line One")
                Text("Line Two")
                Text("Line Three")
                Image("profile")
                Button("Click Here", action: {})
                    .foregroundColor(.green)
                HStack {
                    Spacer()
                    Text("Centered Text")
                    Spacer()
                }.padding()
            }
            .font(.title)
        }
    }
}

struct List_WithStaticData_Previews: PreviewProvider {
    static var previews: some View {
        List_WithStaticData()
    }
}
