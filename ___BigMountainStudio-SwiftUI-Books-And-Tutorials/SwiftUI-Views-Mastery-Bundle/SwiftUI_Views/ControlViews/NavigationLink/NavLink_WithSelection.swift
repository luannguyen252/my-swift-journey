//  Copyright © 2021 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct NavLink_WithSelection: View {
    @State var nav: String?
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView("NavigationLink",
                           subtitle: "With selection",
                           desc: "You can automatically have a NavigationLink navigate to another view using a specified value. When the tag parameter matches the selection parameter, navigation will happen.",
                           back: Color("Theme3ForegroundColor"),
                           textColor: Color("Theme3BackgroundColor"))
                
                Text("AutoNav is: \(nav ?? "nil")")
                
                NavigationLink(destination: NavigationWithSelection(nav: $nav),
                               tag: "To View 2", selection: $nav, label: {})
                
                Button("Navigate to View 2") {
                    nav = "To View 2"
                }
                Spacer()
                DescView(desc: "Notice how SwiftUI automatically resets nav back to nil when navigating back to this screen.",
                         back: Color("Theme3ForegroundColor"),
                         textColor: Color("Theme3BackgroundColor"))
            }
            .font(.title)
            .navigationTitle("Automatic Navigation")
        }
    }
}

struct NavigationWithSelection: View {
    @Binding var nav: String?
    
    var body: some View {
        VStack {
            Text("AutoNav is: \(nav ?? "nil")")
                .font(.title)
        }
        .navigationTitle("Navigation_View2")
    }
}

struct NavLink_WithSelection_Previews: PreviewProvider {
    static var previews: some View {
        NavLink_WithSelection()
    }
}
