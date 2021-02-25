//
//  Scrollview_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 6/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scrollview_Intro : View {
    @State private var names = ["Scott", "Mark", "Chris", "Sean", "Rod", "Meng", "Natasha", "Chase", "Evans", "Paul", "Durtschi", "Max"]
    var body: some View {
        NavigationView {
            GeometryReader { gr in
                ScrollView {
                    ForEach(self.names, id: \.self) { name in
                        NavigationLink(destination: DetailView(name: name)) {
                            HStack {
                                Text(name).foregroundColor(.primary)
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.green)
                                Spacer()
                                Image(systemName: "chevron.right.circle.fill")
                            }
                            .font(.system(size: 24, design: .rounded))
                            .padding().background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 1, y: 1)
                        }
                    } // Set the width on the ForEach (it's a View)
                        .frame(width: gr.size.width - 32)
                        .accentColor(Color.pink).padding()
                }
                .navigationTitle("Cool People")
            }
        }
    }
}

struct DetailView: View {
    var name = ""
    var body: some View {
        Text("You selected: \(name)")
    }
}

struct Scrollview_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Scrollview_Intro()
    }
}
