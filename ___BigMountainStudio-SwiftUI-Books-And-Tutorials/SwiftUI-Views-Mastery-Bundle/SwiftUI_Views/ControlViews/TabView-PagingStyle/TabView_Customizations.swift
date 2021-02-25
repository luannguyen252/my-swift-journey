//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TabView_Customizations: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("TabView",
                       subtitle: "Customizations",
                       desc: "You could include the TabView as another way to do horizontal scrolling through data.")
            
            Text("People")
            
            TabView {
                ForEach(1 ..< 21) { index in
                    VStack(spacing: 20) {
                        Text("Person \(index)")
                        Image("profile\(index)")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(16)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow.opacity(0.7)))
                    .padding()
                }
            }
        }
        .font(.title)
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct TabView_Customizations_Previews: PreviewProvider {
    static var previews: some View {
        TabView_Customizations()
    }
}
