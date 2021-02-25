//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyHStack_Intro: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("LazyHStack",
                       subtitle: "Introduction",
                       desc: "When using the LazyHStack by itself, you won't notice much of a difference from the HStack.")
                .layoutPriority(1)
            
            Text("LazyHStack")
            LazyHStack(spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text("HStack")
            HStack(spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text("Notice the LazyHStack pushes out vertically. (No Spacers being used here.)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
        }
        .font(.title)
    }
}

struct LazyHStack_Intro_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStack_Intro()
    }
}
