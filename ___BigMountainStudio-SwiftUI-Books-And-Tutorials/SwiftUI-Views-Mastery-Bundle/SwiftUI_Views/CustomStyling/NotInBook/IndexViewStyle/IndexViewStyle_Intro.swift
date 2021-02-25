//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct IndexViewStyle_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("IndexViewStyle",
                       subtitle: "Introduction",
                       desc: "The IndexViewStyle formats the dots you see when you are using the TabView paging style. -- Not sure we can customize this.")
            
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
            .font(.title)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .font(.title)
    }
}

//struct SquareIndexViewStyle: IndexViewStyle {
//
//}

struct IndexViewStyle_Intro_Previews: PreviewProvider {
    static var previews: some View {
        IndexViewStyle_Intro()
    }
}
