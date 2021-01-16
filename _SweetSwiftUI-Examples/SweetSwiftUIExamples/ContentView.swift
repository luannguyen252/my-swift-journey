//
//  ContentView.swift
//  SweetSwiftUIExamples
//
//  Created by Luan Nguyen on 16/01/2021.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 8) {
                    NavigationLink(destination: Ch01_HelloSwiftUI()) {
                        Text("Ch01_HelloSwiftUI")
                    }
                    NavigationLink(destination: Ch02View()) {
                        Text("Ch02View")
                    }
                    NavigationLink(destination: Ch03View()) {
                        Text("Ch03View")
                    }
                    NavigationLink(destination: Ch04View()) {
                        Text("Ch04View")
                    }
                    NavigationLink(destination: Ch05View()) {
                        Text("Ch05View")
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    NavigationLink(destination: Ch06View()) {
                        Text("Ch06View")
                    }
                    NavigationLink(destination: Ch07View()) {
                        Text("Ch07View")
                    }
                    NavigationLink(destination: Ch08View()) {
                        Text("Ch08View")
                    }
                    NavigationLink(destination: Ch09View()) {
                        Text("Ch09View")
                    }
                    NavigationLink(destination: Ch10View()) {
                        Text("Ch10View")
                    }
                    NavigationLink(destination: Ch11View()) {
                        Text("Ch11View")
                    }
                }
            }
            .navigationBarTitle("SweetSwiftUIExamples")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
