//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TextField_LimitText: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text("Limit to 10")
            TextField("10 characters", text: $text)
                .onChange(of: text, perform: { value in
                    text = String(value.prefix(10))
                })
            TextField("10 characters", text: $text) { value in
                text = String(text.prefix(10))
            }
        }
    }
}

struct TextField_LimitText_Previews: PreviewProvider {
    static var previews: some View {
        TextField_LimitText()
    }
}
