//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TextEditor_KeyboardSafeArea: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("TextEditor",
                       subtitle: "Keyboard Safe Area",
                       desc: "TextEditors will automatically move into view when the keyboard appears. The keyboard adjusts the safe area so it will not cover views.",
                       back: .pink)
            Spacer()
            Button(action: {
                self.hideKeyboard()
            }) {
                Image(systemName: "keyboard.chevron.compact.down")
            }
            TextEditor(text: $text)
                .frame(height: 200)
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.pink))
                .padding(.horizontal)
            
            Spacer()
        }
        .font(.title)
        .accentColor(.pink)
    }
}

struct TextEditor_KeyboardSafeArea_Previews: PreviewProvider {
    static var previews: some View {
        TextEditor_KeyboardSafeArea()
    }
}
