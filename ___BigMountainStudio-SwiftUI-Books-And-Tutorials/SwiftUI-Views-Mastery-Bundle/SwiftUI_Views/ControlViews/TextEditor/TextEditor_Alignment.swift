//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TextEditor_Alignment: View {
    @State private var text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("TextEditor",
                       subtitle: "Alignment",
                       desc: "By default the alignment is leading. You can change this just as you can change it for the Text view.",
                       back: .pink)
            
            VStack {
                TextEditor(text: $text)
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                    .frame(height: 130)
                    .border(Color.secondary.opacity(0.5), width: 1)
                
                TextEditor(text: $text)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .frame(height: 130)
                    .border(Color.secondary.opacity(0.5), width: 1)
                
                TextEditor(text: $text)
                    .multilineTextAlignment(.trailing)
                    .font(.title2)
                    .frame(height: 130)
                    .border(Color.secondary.opacity(0.5), width: 1)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct TextEditor_Alignment_Previews: PreviewProvider {
    static var previews: some View {
        TextEditor_Alignment()
    }
}
