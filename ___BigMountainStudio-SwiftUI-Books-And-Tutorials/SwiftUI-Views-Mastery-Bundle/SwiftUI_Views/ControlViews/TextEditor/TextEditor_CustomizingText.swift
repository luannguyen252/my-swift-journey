//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TextEditor_CustomizingText: View {
    @State private var text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("TextEditor",
                       subtitle: "Customize the Text",
                       desc: "You can apply other modifiers that you usually use for the text view to the TextEditor to customize the text.",
                       back: .pink)
            VStack {
                Text("Enter comments here")
                TextEditor(text: $text)
                    .font(Font.system(size: 20, weight: .thin, design: .serif))
                    .foregroundColor(.yellow)
                    .background(Color.red)
                    .border(Color.secondary.opacity(0.5), width: 1)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct TextEditor_CustomizingText_Previews: PreviewProvider {
    static var previews: some View {
        TextEditor_CustomizingText()
            .preferredColorScheme(.dark)
    }
}
