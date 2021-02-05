
import SwiftUI
import PlaygroundSupport

struct Keypad: View {
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Spacer()
                Text("1")
                Spacer()
                Text("2")
                Spacer()
                Text("3")
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("4")
                Spacer()
                Text("5")
                Spacer()
                Text("6")
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("7")
                Spacer()
                Text("8")
                Spacer()
                Text("9")
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("0")
                Spacer()
            }
        }
        .font(.title)
        .padding()
        .frame(width: 375, height: 256)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(20)
    }
}

PlaygroundPage.current.setLiveView(Keypad())
