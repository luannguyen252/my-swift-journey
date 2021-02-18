import SwiftUI

struct ContentView: View {
    @State private var name = "Luan"
    
    var body: some View {
        VStack(spacing: 16) {
            Menu {
                Picker(selection: $name, label: Text("Picker"), content: {
                    Text("Steve").tag("Steve")
                    Text("Cook").tag("Cook")
                    Text("Elon").tag("Elon")
                    Text("Bill").tag("Bill")
                })
            } label: {
                Label (
                    title: { Text("You Pick: \(name)") },
                    icon: { Image(systemName: "person.crop.circle.fill") }
                )
                .frame(maxWidth: .infinity)
            }
            Spacer()
        }
        .font(.title)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
