// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

// see https://stackoverflow.com/questions/61925943/is-there-a-way-to-blur-the-background-of-a-tapped-element-in-swiftui
struct SelectionEffectView: View {
    let images = ["sun.max", "moon", "cloud"]

    @State private var selected: String? = nil

    var body: some View {
        VStack {
            ForEach(images, id: \.self) { name in
                Image(systemName: name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        if self.selected == name {
                            self.selected = nil
                        } else {
                            self.selected = name
                        }
                    }
                    .blur(radius: self.selected != nil && self.selected != name ? 10 : 0)
                    .scaleEffect(self.selected == name ? 1.2 : 1)
            }
        }
        .animation(.spring())
    }
}

struct SelectionEffectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionEffectView()
    }
}
