//  Copyright © 2021 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct NavLink_Intro: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("",
                           subtitle: "Introduction",
                           desc: "Use NavigationLink to navigate to a new view inside a NavigationView.",
                           back: Color("Theme3ForegroundColor"),
                           textColor: Color("Theme3BackgroundColor"))
                NavigationLink("Just Text", destination: SecondView())
                Spacer()
                DescView(desc: "This is the basic implementation using just text and a destination. The destination can be any view.",
                         back: Color("Theme3ForegroundColor"),
                         textColor: Color("Theme3BackgroundColor"))
            }
            .navigationTitle("NavigationLink")
        }
        .font(.title)
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            Text("View 2")
                .font(.largeTitle)
            Spacer()
        }
    }
}

struct NavLink_Intro_Previews: PreviewProvider {
    static var previews: some View {
        NavLink_Intro()
    }
}
