// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct TextFieldExampleView: View {

    @State var value = "ABC"
    @State var numberValue: Int = 123

    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                Text("TextField")
                TextField("Value", text: $value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            VStack(alignment: .leading) {
                Text("TextField with formatter")
                TextField("Number value", value: $numberValue, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            VStack(alignment: .leading) {
                Text("SecureField")
                SecureField("Value", text: $value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }
}

struct TextFieldExampleView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExampleView()
    }
}
