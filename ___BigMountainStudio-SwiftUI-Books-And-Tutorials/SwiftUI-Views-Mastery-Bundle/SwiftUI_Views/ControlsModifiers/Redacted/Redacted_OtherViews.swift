//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Redacted_OtherViews: View {
    @State private var text = "Redact this text!"
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Redacted",
                       subtitle: "Other Views",
                       desc: "The redacted modifier also works on some other views that contain text.",
                       back: .purple, textColor: .white)
            
            VStack(spacing: 20) {
                Text("SecureField")
                SecureField("name", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .redacted(reason: .placeholder)
                
                Text("TextField")
                TextField("name", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .redacted(reason: .placeholder)
                
                Text("TextEditor")
                TextEditor(text: $text)
                    .redacted(reason: .placeholder)
                    .border(Color.secondary.opacity(0.5), width: 1)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct Redacted_OtherViews_Previews: PreviewProvider {
    static var previews: some View {
        Redacted_OtherViews()
    }
}
