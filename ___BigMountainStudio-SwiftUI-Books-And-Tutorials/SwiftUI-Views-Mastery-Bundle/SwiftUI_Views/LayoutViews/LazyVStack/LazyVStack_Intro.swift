//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyVStack_Intro: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("LazyVStack",
                       subtitle: "Introduction",
                       desc: "When using the LazyVStack by itself, you won't notice much of a difference from the VStack.")
                .layoutPriority(1)
            
            Text("LazyVStack")
            LazyVStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2) // Draws a border around the frame of the view
            
            Text("VStack")
            VStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text("Notice the LazyVStack pushes out horizontally. (No Spacers being used here.)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
        }
        .font(.title)
    }
}

struct LazyVStack_Intro_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStack_Intro()
    }
}
