//  Copyright © 2021 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct NavLink_WithIsActive: View {
    @State var nav = false
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView("NavigationLink",
                           subtitle: "With isActive",
                           desc: "You can automatically have a NavigationLink navigate to another view using a boolean.",
                           back: Color("Theme3ForegroundColor"),
                           textColor: Color("Theme3BackgroundColor"))
                Text("AutoNav is: \(nav.description)")
                
                NavigationLink(destination: NavLink_View2(nav: $nav), isActive: $nav,
                               label: { EmptyView() })
                
                Button("Navigate to View 2") {
                    nav = true
                }
                Spacer()
                DescView(desc: "Notice how SwiftUI automatically resets nav.autoNav back to false when navigating back to this screen.",
                         back: Color("Theme3ForegroundColor"),
                         textColor: Color("Theme3BackgroundColor"))
            }
            .font(.title)
            .navigationTitle("Automatic Navigation")
        }
    }
}

struct NavLink_View2: View {
    @Binding var nav: Bool
    
    var body: some View {
        VStack {
            Text("AutoNav is: \(nav.description)")
                .font(.title)
        }
        .navigationTitle("View 2")
    }
}

struct NavLink_WithIsActive_Previews: PreviewProvider {
    static var previews: some View {
        NavLink_WithIsActive()
    }
}
