// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import KeyboardAware
import SwiftUI

struct KeyboardAwareView: View {
    @State var text = "example"

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0 ..< 20) { i in
                        Text("Text \(i):")
                        TextField("Text", text: self.$text)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 10)
                    }
                }
                .padding()
            }
            .keyboardAware()
            .navigationBarTitle("Keyboard Example")
        }

    }
}

struct KeyboardAwareView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardAwareView()
    }
}
