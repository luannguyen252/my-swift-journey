//
//  TextField_1_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TextField_Intro : View {
    @State private var textFieldData = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Group {
                Text("TextField").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("It is required to bind text fields to a variable when using them so you can get/set the text.").frame(maxWidth: .infinity).padding()
                    .background(Color.orange)
            }
            Text("TextFieldStyle")
                .foregroundColor(.gray)
            
            Text("By default, TextFields have a plain TextFieldStyle that has no visual content to be seen.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.orange)
            Image(systemName: "arrow.down.circle")
            TextField("", text: $textFieldData)
            Image(systemName: "arrow.up.circle")
            Text("Use .textFieldStyle(RoundedBorderTextFieldStyle()) to show a border.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.orange)
            TextField("", text: $textFieldData)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
        }
        .font(.title)
        .minimumScaleFactor(0.7)
    }
}


struct TextField_Intro_Previews : PreviewProvider {
    static var previews: some View {
        TextField_Intro()
    }
}
