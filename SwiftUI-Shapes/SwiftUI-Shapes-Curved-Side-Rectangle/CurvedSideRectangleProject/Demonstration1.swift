//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Demonstration1: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                CurvedSideRectangle(bottomOffset: change ? 40 : -40)
                    .fill(Color.themeSecondary)
                    .frame(height: 100.0)
                    .shadow(radius: 8)
                    .overlay(
                        Text("Concert!")
                            .font(.largeTitle)
                            .fontWeight(.black)
                )
                
                Spacer()
                
                Button("Change") {
                    withAnimation {
                        self.change.toggle()
                    }
                }
                
                 Spacer()
                // Other Content
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct Demonstration1_Previews: PreviewProvider {
    static var previews: some View {
        Demonstration1()
    }
}
