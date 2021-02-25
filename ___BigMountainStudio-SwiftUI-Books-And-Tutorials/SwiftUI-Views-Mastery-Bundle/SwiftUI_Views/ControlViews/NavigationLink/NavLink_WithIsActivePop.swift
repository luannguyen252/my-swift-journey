//  Copyright © 2021 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct NavLink_WithIsActivePop: View {
    @State var nav = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("NavigationLink",
                           subtitle: "Pop with isActive",
                           desc: "By changing the property bound to isActive back to false, you can programmatically navigate backwards.",
                           back: Color("Theme3ForegroundColor"),
                           textColor: Color("Theme3BackgroundColor"))
                Text("AutoNav is: \(nav.description)")
                
                NavigationLink(destination: NavLink_View2(nav: $nav), isActive: $nav,
                               label: { EmptyView() })
                
                Button("Navigate to View 2") {
                    nav = true
                }
                Spacer()
            }
            .font(.title)
            .navigationTitle("Automatic Navigation")
        }
    }
}

struct NavLink_SecondView: View {
    @Binding var nav: Bool
    
    var body: some View {
        VStack {
            Text("AutoNav is: \(nav.description)")
            NavigationLink("Navigate to View 3", destination: NavLink_ThirdView(nav: $nav))
        }
        .font(.title)
        .navigationTitle("View 2")
    }
}

struct NavLink_ThirdView: View {
    @Binding var nav: Bool
    
    var body: some View {
        VStack {
            Text("AutoNav is: \(nav.description)")
            Button("Go to Root View") {
                nav.toggle()
            }
        }
        .font(.title)
        .navigationTitle("View 3")
    }
}

struct NavLink_WithIsActivePop_Previews: PreviewProvider {
    static var previews: some View {
        NavLink_WithIsActivePop()
    }
}
