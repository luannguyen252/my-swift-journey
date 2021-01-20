//
//  GradientButtonStyle.swift
//  BookmarkSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 04/09/20.
//  Copyright © 2020 Shreyas Vilaschandra Bhike. All rights reserved.
//

import SwiftUI

struct GradientButtonStyle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}



struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
    }
}

struct GradientButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        GradientButtonStyle()
    }
}
