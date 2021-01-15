//
//  TextFieldExample.swift
//  RespondingToEvents
//
//  Created by kim sunchul on 2020/05/04.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct TextFieldExample: View {
    @State private var name:String = ""
    @State private var password:String = ""

    var body: some View {
        VStack {
//          TextField는 UI필드와 다르게 기본이 라운드가 없다. 지정할려면 textFieldStyle modifier를 사용해야함.
//          TextField는 자동완성이 기본이다. 사용하지 않을려면 disableAutocorrection을 사용해야함.
            TextField("Enter your name", text:$name)    .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
            Text("Hello, \(name)!")
//           SecureField는 입력된 텍스트들을 가려준다. ex:)password
            SecureField("Enter a password", text:$password)
            Text("You entered : \(password)")
        }
    }
}

struct TextFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExample()
    }
}
