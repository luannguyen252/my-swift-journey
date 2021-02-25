//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TextEditor_LineLimit: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("TextEditor",
                       subtitle: "Line Limit",
                       desc: "Use the lineLimit modifier to restrict how much text to allow the user to enter.",
                       back: .pink)
            VStack {
                Text("Enter 2 lines of comments here")
                TextEditor(text: $text)
                    .lineLimit(2)
                    .font(.title2)
                    .frame(height: 100)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 8).stroke())
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .font(.title)
    }
}

struct TextEditor_LineLimit_Previews: PreviewProvider {
    static var previews: some View {
        TextEditor_LineLimit()
    }
}
