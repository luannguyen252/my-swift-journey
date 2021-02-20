import SwiftUI
import KeyboardAware

struct ContentView: View {
    var body: some View {
        KeyboardAwareView()
    }
}

// Keyboard Aware View
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
            .keyboardAware() /// The view modifier
            .navigationBarTitle("Keyboard Example")
        }

    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
