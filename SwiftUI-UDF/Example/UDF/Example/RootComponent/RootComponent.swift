//
//  RootComponent.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI
import SwiftUI_UDF

struct RootComponent<Login: Container, Main: Container>: Component {
    struct Props {
        var isLoggedIn: Bool
        
        var loginFlow: () -> Login
        var mainFlow: () -> Main
    }
    
    var props: Props
    
    var body: some View {
        if props.isLoggedIn {
            props.mainFlow()
        } else {
            props.loginFlow()
        }
    }
}

struct RootComponent_Previews: PreviewProvider {
    static var previews: some View {
        RootComponent(
            props: .init(
                isLoggedIn: false,
                loginFlow: { RenderContainer(viewToRender: LoginComponent_Previews.previews )},
                mainFlow: { RenderContainer(viewToRender: MainComponent_Previews.previews )}
            )
        )
    }
}
