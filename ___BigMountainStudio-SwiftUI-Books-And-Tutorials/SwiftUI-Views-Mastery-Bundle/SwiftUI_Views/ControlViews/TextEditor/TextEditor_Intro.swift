//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TextEditor_Intro: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("TextEditor",
                       subtitle: "Introduction",
                       desc: "Use the TextEditor to allow the user to enter a body of text that is more than a single line.",
                       back: .pink)
            VStack {
                Text("Enter comments here")
                TextEditor(text: $text)
                    .font(.title2)
                    .border(Color.secondary.opacity(0.5), width: 1)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct TextEditor_Intro_Previews: PreviewProvider {
    static var previews: some View {
        TextEditor_Intro()
    }
}
