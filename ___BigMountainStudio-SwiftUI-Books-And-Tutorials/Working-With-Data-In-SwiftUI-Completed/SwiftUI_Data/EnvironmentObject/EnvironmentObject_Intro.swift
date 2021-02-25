//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

// You're using a class that conforms to ObservableObject so you can bind to properties within it
class NameInfo: ObservableObject {
    @Published var name: String = ""
}

struct EnvironmentObject_Intro: View {
    var body: some View {
        TabView {
            TabViewOne()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("One")
                }
            
            TabViewTwo()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Two")
                }
        }
        .environmentObject(NameInfo()) // The environment object is added to the PARENT view
        .font(.title)
    }
}

struct TabViewOne: View {
    @EnvironmentObject var nameInfo: NameInfo

    var body: some View {
        VStack {
            Text("Tab 1")
                .font(.largeTitle)
            HeaderView("@EnvironmentObject", subtitle: "Introduction", desc: "Use the environmentObject modifier to add ObservableObjects to parent views.", back: .purple, textColor: .white)
            Spacer()
            TextField("Add a name", text: $nameInfo.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            Spacer()
        }
    }
}

struct TabViewTwo: View {
    @EnvironmentObject var nameData: NameInfo
    
    var body: some View {
        VStack {
            Text("Tab 2")
                .font(.largeTitle)
            
            HeaderView("@EnvironmentObject", subtitle: "Introduction", desc: "This view can access the environment object by using the @EnvironmentObject property wrapper.", back: .purple, textColor: .white)
            Spacer()
            Text("The name you entered on Tab 1 was:")
                .padding()
            Text("\(nameData.name)")
                .bold()
            Spacer()
        }
    }
}

struct EnvironmentObject_Intro_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObject_Intro()
    }
}
