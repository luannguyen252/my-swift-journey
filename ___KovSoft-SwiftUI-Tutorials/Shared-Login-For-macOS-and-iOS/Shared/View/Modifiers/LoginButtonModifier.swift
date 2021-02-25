//
//  LoginButtonModifier.swift
//  SharedLogin (iOS)
//
//  Created by Balaji on 11/01/21.
//

import SwiftUI

struct LoginButtonModifier: ViewModifier {

    @EnvironmentObject var homeData: LoginViewModel
    
    func body(content: Content) -> some View {
        return content
            .aspectRatio(contentMode: .fit)
            .frame(width: homeData.ismacOS ? 16 : 20, height: homeData.ismacOS ? 16 : 20)
            .foregroundColor(.white)
            .padding(12)
            .background(
            
                LinearGradient(gradient: .init(colors: [Color("gradient1"),Color("gradient2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .clipShape(Circle())
    }
}

