//
//  CustomButtonModifier.swift
//  Login_Scroll
//
//  Created by Balaji on 18/10/20.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {

    func body(content: Content) -> some View {
        
        return content
            .foregroundColor(.white)
            .padding(.vertical)
            .padding(.horizontal,35)
            .background(
            
                LinearGradient(gradient: .init(colors: [Color("yellow-light"),Color("yellow")]), startPoint: .leading, endPoint: .trailing)
            )
            .clipShape(Capsule())
    }
}
