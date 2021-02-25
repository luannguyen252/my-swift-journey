//
//  TextField_Alignment.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 10/16/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TextField_Alignment: View {
    @State private var textFieldData1 = "Leading"
    @State private var textFieldData2 = "Center"
    @State private var textFieldData3 = "Trailing"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField").font(.largeTitle)
            Text("Text Alignment").foregroundColor(.gray)
            Text("Change the alignment of text within your textfield by using the multilineTextAlignment modifier.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.orange)
                
            Group {
                TextField("Leading", text: $textFieldData1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading) // Default
                
                TextField("Center", text: $textFieldData2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                
                TextField("Trailing", text: $textFieldData3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal)
        }.font(.title)
    }
}

struct TextField_Alignment_Previews: PreviewProvider {
    static var previews: some View {
        TextField_Alignment()
    }
}
