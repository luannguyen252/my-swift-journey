//
//  ContentView1.swift
//  SwiftUIList
//
//  Created by Alex Nagy on 24.02.2021.
//

import SwiftUI

struct ContentView1: View {
    
    var stringArray = [
        "Element 0",
        "Element 1",
        "Element 2",
        "Element 3",
        "Element 4",
        "Element 5",
        "Element 6",
        "Element 7",
        "Element 8",
        "Element 9",
        "Element 10"
    ]
    
    var body: some View {
        VStack {
            List(stringArray, id:\.self) { string in
//                Text(string)
                CustomRow(string: string)
            }
//            .listStyle(GroupedListStyle())
//            .listStyle(InsetListStyle())
//            .listStyle(SidebarListStyle())
//            .listStyle(InsetGroupedListStyle())
            
//            ScrollView {
//                ForEach(stringArray, id: \.self) { string in
//                    HStack {
//                        CustomRow(string: string)
//                        Spacer()
//                    }.frame(height: 44)
//                }
//            }
//            .padding(.horizontal, 12)
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}

struct CustomRow: View {
    
    var string: String
    
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .renderingMode(.original)
            Text(string)
        }
    }
}
