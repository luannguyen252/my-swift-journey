//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class JustForTabTwo: ObservableObject {
    @Published var name: String = "This string is from the @EnvironmentObject."
}

struct EnvironmentObject_OnParenView: View {
    var body: some View {
        TabView {
            HeaderView("@EnvironmentObject", subtitle: "On Parent Views", desc: "There is no environment object set on this view's parent view. So has no access to any environment objects.", back: .purple, textColor: .white)
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("One")
                }
            
            TabTwoView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Two")
                }
                .environmentObject(JustForTabTwo())
        }
        .font(.title)
    }
}

struct TabTwoView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40.0) {
                Text("Tab 2")
                
                HeaderView("", subtitle: "On Parent View", desc: "Since the environment object was only added to this view, only child views from this parent can access it.", back: .purple, textColor: .white)
                
                Text("Note: This view is not using the environment object but it could if it wanted to.")
                
                NavigationLink(destination: TabTwoChildView(),
                               label: { Text("Navigate to Child View") })
                
                Spacer()
            }
            .navigationTitle("@EnvironmentObject")
        }
    }
}

struct TabTwoChildView: View {
    @EnvironmentObject var tabTwo: JustForTabTwo
    
    var body: some View {
        VStack(spacing: 40.0) {
            HeaderView("", subtitle: "On Parent View", desc: "This view IS accessing the environment object set on the parent tab view.", back: .purple, textColor: .white)
                .layoutPriority(1)
            
            Label(title: { Text(tabTwo.name) },
                  icon: { Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.orange) })
            
            Spacer()
            
            TextEditor(text: $tabTwo.name)
                .border(Color.purple, width: 2)
                .frame(height: 200)
        }
        .navigationTitle("Tab 2 Child View")
    }
}

struct EnvironmentObject_OnParenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EnvironmentObject_OnParenView()
            
            TabTwoView()
            
            TabTwoChildView()
//                .environmentObject(JustForTabTwo())
        }
        .font(.title)
    }
}
