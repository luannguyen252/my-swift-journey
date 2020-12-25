//
//  MultipleSheets.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 25/12/2020.
//

import SwiftUI

struct MultipleSheets: View {
    var title: String
    @State private var showSheet = false
    
    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text(title)
        }).sheet(isPresented: $showSheet, content: {
            Text("Sheet for \(title)")
        })
    }
}

struct MultipleSheets_Previews: PreviewProvider {
    static var previews: some View {
        List {
            MultipleSheets(title: "Button 1")
            MultipleSheets(title: "Button 2")
        }
    }
}
