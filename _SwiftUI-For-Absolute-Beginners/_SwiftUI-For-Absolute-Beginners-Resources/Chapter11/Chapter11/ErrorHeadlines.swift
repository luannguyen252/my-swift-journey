//
//  ErrorHeadlines.swift
//  Chapter11
//
//  Created by Jayant Varma on 21/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct ViewWithError: View {
    var body: some View {
        Text("Hello World!")
        .modifier(ErrorHeadlines())
    }
}

struct ErrorHeadlines: ViewModifier {
    func body(content: Content) -> some View {
        return content
        .padding()
            .font(.largeTitle)
            .foregroundColor(Color.black)
            .background(Color.blue.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.2), lineWidth: 1)
            )
            .shadow(radius: 2)
    }
}

struct ErrorHeadlines_Previews: PreviewProvider {
    static var previews: some View {
        ViewWithError()
    }
}
