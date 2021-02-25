//
//  ContentView4.swift
//  SwiftUIList
//
//  Created by Alex Nagy on 24.02.2021.
//

import SwiftUI

struct ContentView4: View {
    
    @State var data = [
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
        NavigationView {
            List {
                ForEach(data, id: \.self) { string in
//                    CustomRow(string: string)
                    NavigationLink(destination: DetailView(string: string)) {
                        CustomRow(string: string)
                    }
                }
            }
            .navigationTitle("Nav Bar")
        }
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}

struct DetailView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    var string: String
    
    var body: some View {
        VStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Go Back from \(string)")
            }
            Spacer()
        }
//        .navigationTitle(string)
//        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
