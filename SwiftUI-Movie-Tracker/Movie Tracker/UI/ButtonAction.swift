import SwiftUI

struct ButtonAction: View {
    var body: some View {
        Button(action: {
            print("Button is pressed.")
        }) {
            HStack {
                Text("Tap Me")
                Image(systemName: "gamecontroller")
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(16)
            .foregroundColor(.white)
        }
    }
}

struct ButtonAction_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAction()
    }
}
