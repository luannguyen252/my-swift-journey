//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ScrollViewReader_Animating: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("ScrollViewReader",
                       subtitle: "Animation",
                       desc: "You can animate the scrolling by putting withAnimation around the scrollTo function.")
            ScrollViewReader { scrollViewProxy in
                Button("Animate Scrolling To Bottom") {
                    withAnimation { scrollViewProxy.scrollTo(50) }
                }
                ScrollView(showsIndicators: true) {
                    ForEach(1..<51) { index in
                        getImage(for: index)
                            .font(.largeTitle)
                            .frame(height: 70)
                            .id(index)
                    }
                }
                Button("Animate Scrolling To Top") {
                    withAnimation { scrollViewProxy.scrollTo(1) }
                }
            }
        }
        .font(.title)
    }
    
    func getImage(for index: Int) -> some View {
        if index == 1 || index == 50 {
            return Image(systemName: "\(index).square.fill")
                .foregroundColor(.red)
        }
        return Image(systemName: "\(index).square")
            .foregroundColor(.primary)
    }
}

struct ScrollViewReader_Animating_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReader_Animating()
    }
}
