//
//  CustomStyling_ManyControls.swift
//  100Views
//
//  Created by Mark Moeykens on 9/14/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct CustomStyling_ManyControls: View {
    @State private var toggleState = true
    @State private var text = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                HeaderView("ViewModifier",
                           subtitle: "Applied to Many Controls",
                           desc: "You may want to descriptively name your custom view modifier because you will find it can be applied to many different controls.", back: .red, textColor: .white)
                    .font(.title)
                
                Button("Applied to a Button", action: {})
                    .modifier(RedBanner())
                    // Add more modifiers on top of your custom modifier
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                HStack {
                    Text("Applied to Symbols  ")
                    Image(systemName: "eyedropper")
                    Image(systemName: "eyedropper.halffull")
                    Image(systemName: "eyedropper.full")
                }.modifier(RedBanner())
                
                Toggle("Applied to a Toggle", isOn: $toggleState)
                    .modifier(RedBanner())
                
                TextField("Applied to a TextField", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .modifier(RedBanner())
                    // Override RedBanner's foreground color
                    .foregroundColor(.primary)
                
                HStack {
                    Text("Applied to Shapes")
                    Circle().frame(height: 30)
                    RoundedRectangle(cornerRadius: 5)
                }.modifier(RedBanner())
            }
            .minimumScaleFactor(0.5)
        }
    }
}

struct RedBanner: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .font(.title)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
    }
}

struct CustomStyling_ManyControls_Previews: PreviewProvider {
    static var previews: some View {
        CustomStyling_ManyControls()
    }
}
