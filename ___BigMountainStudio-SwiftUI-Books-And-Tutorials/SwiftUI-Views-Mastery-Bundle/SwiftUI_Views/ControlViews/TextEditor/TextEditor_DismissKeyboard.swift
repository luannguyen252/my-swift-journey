//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct TextEditor_DismissKeyboard: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("TextEditor",
                       subtitle: "Dismiss the Keyboard",
                       desc: "You may wonder how to dismiss the keyboard. There is no way to do it in SwiftUI but here is a solution I learned from Paul Hudson.",
                       back: .pink)
            VStack {
                HStack {
                    Text("Enter comments here")
                    Spacer()
                    Button(action: {
                        self.hideKeyboard()
                    }) {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
                TextEditor(text: $text)
                    .font(.title2)
                    .border(Color.secondary.opacity(0.5), width: 1)
            }
            .padding(.horizontal)
        }
        .font(.title)
        .accentColor(.pink)
    }
}

struct TextEditor_DismissKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        TextEditor_DismissKeyboard()
    }
}
