import SwiftUI
import PlaygroundSupport

struct Symbols: View {
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .font(.system(size: 96))
            .foregroundColor(.blue)
    }
}

PlaygroundPage.current.setLiveView(Symbols())
