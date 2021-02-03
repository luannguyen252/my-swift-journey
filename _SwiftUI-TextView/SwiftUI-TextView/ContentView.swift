import SwiftUI
import TextView

struct ContentView: View {
    @State var text = ""
    @State var isEditing = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isEditing.toggle()
            }) {
                Text("\(isEditing ? "Stop" : "Start") editing")
            }
            TextView(
                text: $text,
                isEditing: $isEditing,
                placeholder: "Enter text here"
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
