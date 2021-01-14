//
//  TextFieldView.swift
//  UIControls
//
//  Created by Sud on 6/17/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

struct TextFieldView : View {
    @State var defaultText = ""
    @State var plainText = ""
    @State var roundBorderText = ""
    @State var rightAlignedText = ""
    @State var secureText = ""
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Plain Text Style")
                    Divider()
                    TextField("Optional", text: $plainText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
            }
            Section {
                HStack {
                    Text("Default Text Style")
                    Divider()
                    TextField("Optional", text: $defaultText)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
            }
            Section {
                HStack {
                    Text("Round Border")
                    Divider()
                    TextField("Optional", text: $roundBorderText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            Section {
                HStack {
                    Text("Right Aligned")
                    Divider()
                    TextField("Optional", text: $rightAlignedText).multilineTextAlignment(.trailing)
                }
            }
            Section {
                HStack {
                    Text("Secure Text")
                    Divider()
                    SecureField("Optional", text: $secureText)
                }
            }
        }
        .navigationBarTitle(Text("Text Field"))
        
    }
}

#if DEBUG
struct TextFieldView_Previews : PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
#endif
