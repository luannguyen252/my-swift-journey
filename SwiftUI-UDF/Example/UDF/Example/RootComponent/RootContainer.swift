//
//  RootContainer.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation
import SwiftUI_UDF

struct RootContainer: Container {
    typealias ContainerComponent = RootComponent<LoginContainer, MainContainer>
    
    func map(state: AppState, store: AppEnvironmentStore) -> ContainerComponent.Props {
        .init(
            isLoggedIn: isLogedIn(state: state),
            loginFlow: { LoginContainer() },
            mainFlow: { MainContainer() }
        )
    }
    
    func isLogedIn(state: AppState) -> Bool {
        if case .session = state.loginFlow {
            return true
        }
        
        return false
    }
}
