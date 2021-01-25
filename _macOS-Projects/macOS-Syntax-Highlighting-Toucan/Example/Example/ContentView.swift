import SwiftUI

struct ContentView: View {
    @State private var swift1: String = ""
    @State private var swift2: String = ""

    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Light Theme")
                    .font(.system(size: 20, weight: .medium))

                SyntaxTextView(
                    text: $swift1,
                    theme: .constant(DefaultThemeLight())
                )
                .cornerRadius(5)
            }
            .padding([.top, .bottom, .leading], 20)

            VStack(alignment: .leading, spacing: 10) {
                Text("Dark Theme")
                    .font(.system(size: 20, weight: .medium))

                SyntaxTextView(
                    text: $swift2,
                    theme: .constant(DefaultThemeDark())
                )
                .cornerRadius(5)
            }
            .padding([.top, .bottom, .trailing], 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
