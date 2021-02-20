// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct ScrollViewExample: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true, content: {
            HStack {
                ForEach(1 ..< 14, id: \.self) { day in
                    VStack {
                        Image(systemName: "sun.max")
                            .font(.system(size: 30))
                            .padding()
                        Text("Day \(day)")
                    }
                }
            }
            .padding()
        })
    }
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
