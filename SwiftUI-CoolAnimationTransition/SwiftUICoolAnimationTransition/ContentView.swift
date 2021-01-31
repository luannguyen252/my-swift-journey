//
//  ContentView.swift
//  SwiftUICoolAnimationTransition
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: HeaderView(title: "Basic Animations")) {
                    NavigationLink(
                        destination: AddProfileView(),
                        label: {
                            Text("Add Profile")
                    })
                }

                Section(header: HeaderView(title: "Advanced Animations")) {
                    NavigationLink(
                        destination: PolygonSidesAnimationView(),
                        label: {
                            Text("Polygon Sides")
                    })

                    NavigationLink(
                        destination: ClockAnalogicView(),
                        label: {
                            Text("Analogic Clock")
                    })
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Cool SwiftUI"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
