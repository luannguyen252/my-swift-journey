//
//  LoginContainer.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI
import SwiftUI_UDF

struct LoginContainer: Container {
    typealias ContainerComponent = LoginComponent
    
    func map(state: AppState, store: AppEnvironmentStore) -> ContainerComponent.Props {
        .init(
            email: Binding(
                get: { state.loginForm.email },
                set: store.bind(AnyAction.UpdateEmail.init(email:))
            ),
            
            password: Binding(
                get: { state.loginForm.password },
                set: store.bind(AnyAction.UpdatePassword.init(password:))
            ),
            
            signInAction: store.bind(AnyAction.SignIn()),
            isLoading: isLoading(state: state)
        )
    }
    
    func isLoading(state: AppState) -> Bool {
        if case .loading = state.loginFlow {
            return true
        }
        
        return false
    }
}

struct LoginContainer_Previews: PreviewProvider {
    static var previews: some View {
        LoginContainer()
    }
}
