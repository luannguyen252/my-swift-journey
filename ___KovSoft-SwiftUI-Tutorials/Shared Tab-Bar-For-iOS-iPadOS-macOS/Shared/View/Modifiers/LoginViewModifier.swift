//
//  LoginViewModifier.swift
//  SharedLogin (iOS)
//
//  Created by Balaji on 11/01/21.
//

import SwiftUI

struct LoginViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        
        // For Better And Clean Code....
        return content
            .padding()
            .padding(.bottom,25)
            .background(Color.white)
            .cornerRadius(25)
            .padding(.vertical)
            .padding(.bottom)
            .padding(.horizontal,25)
    }
}
