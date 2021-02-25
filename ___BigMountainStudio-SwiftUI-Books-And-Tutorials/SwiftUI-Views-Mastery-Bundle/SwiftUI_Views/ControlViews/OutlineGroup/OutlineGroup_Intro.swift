//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

// Need to conform to Identifiable
//struct Parent: Identifiable {
//    var id = UUID()
//    var name = ""
//    var children: [Parent]? // Had to make this optional
//}

struct OutlineGroup_Intro: View {
    var parents = [Parent(name: "Mark",
                          children: [Parent(name: "Paola")]),
                   Parent(name: "Rodrigo",
                          children: [Parent(name: "Kai"),
                                     Parent(name: "Brennan"),
                                     Parent(name: "Easton")]),
                   Parent(name: "Marcella",
                          children: [Parent(name: "Sam",
                                            children: [Parent(name: "Joe")]),
                                     Parent(name: "Melissa"),
                                     Parent(name: "Melanie")])]
    
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("OutlineGroup",
                       subtitle: "Introduction",
                       desc: "This is very similar to using the List with the children parameter except this container does not scroll.", back: Color.red)
            
            OutlineGroup(parents, children: \.children) { parent in
                HStack {
                    Image(systemName: "person.circle")
                    Text("\(parent.name)")
                }
            }
            .padding(.horizontal)
            .accentColor(.red)
        }
        .font(.title)
    }
}


struct OutlineGroup_Intro_Previews: PreviewProvider {
    static var previews: some View {
        OutlineGroup_Intro()
    }
}
