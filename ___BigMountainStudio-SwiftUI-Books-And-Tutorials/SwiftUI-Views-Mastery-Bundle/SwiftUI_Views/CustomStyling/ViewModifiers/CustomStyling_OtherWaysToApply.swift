//
//  CustomStyling_AsExtensionFunction.swift
//  100Views
//
//  Created by Mark Moeykens on 9/14/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct CustomStyling_OtherWaysToApply: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ViewModifier")
                .font(.largeTitle)
            Text("Different Ways To Apply")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("If you don't like the .modifier syntax, you can turn your custom modifier to its own function available on all View objects.")
                .makeTextBanner() // Using extension method
            
            ModifiedContent(
                content: Text("You can also use ModifiedContent to apply your custom view modifier to a view."),
                modifier: TextBanner())
            
            Spacer()
        }
    }
}
// Extension method on View
extension View {
    func makeTextBanner() -> some View {
        self
            .frame(maxWidth: .infinity)
            .font(.title).padding()
            .background(Color.red)
            .foregroundColor(.white)
    }
}

struct CustomStyling_OtherWaysToApply_Previews: PreviewProvider {
    static var previews: some View {
        CustomStyling_OtherWaysToApply()
    }
}
