import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var text = "Hello ?"
    
    var body: some View {
        VStack {
            Text(text)
            
            Button("SwiftUI") {
                self.text = "Hello, SwiftUI"
            }
        }
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())

let character: Character = "A"
character.isLetter
character.isNumber
character.isSymbol
character.isCurrencySymbol
character.isASCII
character.isLowercase
