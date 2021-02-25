//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ScrollViewReader_Anchor: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("ScrollViewReader",
                       subtitle: "Anchor",
                       desc: "You can control the position of where you want the view to go when calling scrollTo.")
            
            ScrollViewReader { scrollViewProxy in
                Button("Scroll 25 To Top") {
                    scrollViewProxy.scrollTo(25, anchor: .top)
                }
                
                HStack(spacing: 20) {
                    Button("Scroll 25 To Center") {
                        scrollViewProxy.scrollTo(25, anchor: .center)
                    }
                    
                    ScrollView {
                        ForEach(1..<51) { index in
                            Image(systemName: "\(index).square.fill")
                                .font(.largeTitle)
                                .frame(height: 70)
                                .foregroundColor(index == 25 ? .red : .gray)
                                .id(index)
                        }
                    }
                }
                
                Button("Scroll 25 To Bottom") {
                    scrollViewProxy.scrollTo(25, anchor: .bottom)
                }
            }
        }
        .font(.title)
    }
}

struct ScrollViewReader_Anchor_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReader_Anchor()
    }
}
