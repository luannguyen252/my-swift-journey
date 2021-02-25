//
//  TextField_ContentType.swift
//  100Views
//
//  Created by Mark Moeykens on 6/29/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TextField_ContentType : View {
    @State private var textFieldData = ""

    // TODO: Include this in the book when it actually makes a difference.
    // I expected to see different keyboards show in response to content type.
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            Text("Content Type")
                .font(.title)
                .foregroundColor(.gray)
            Divider()
            TextField("Email Address", text: $textFieldData)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.addressCity) // What kind of data
                .padding(.horizontal)
        }
    }
}

struct TextField_ContentType_Previews : PreviewProvider {
    static var previews: some View {
        TextField_ContentType()
    }
}
