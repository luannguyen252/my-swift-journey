//
//  LoginComponent.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI
import SwiftUI_UDF

struct LoginComponent: Component {
    struct Props {
        var email: Binding<String>
        var password: Binding<String>
        
        var signInAction: Command
        var isLoading: Bool
    }
    
    var props: Props
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TextField("email", text: props.email)
                SecureField("password", text: props.password)
                
                Button(action: props.signInAction) {
                    Text("Sign In")
                        .padding(20)
                        .foregroundColor(Color.primary)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(30)
            .padding(.top, 40)
            .blur(radius: props.isLoading ? 5 : 0)
            
            if props.isLoading {
                LoaderView()
            }
        }
    }
}

struct LoginComponent_Previews: PreviewProvider {
    static var previews: some View {
        LoginComponent(props: .init(
            email: .constant("test 1312312"),
            password: .constant("pass"),
            signInAction: {},
            isLoading: false)
        )
    }
}
