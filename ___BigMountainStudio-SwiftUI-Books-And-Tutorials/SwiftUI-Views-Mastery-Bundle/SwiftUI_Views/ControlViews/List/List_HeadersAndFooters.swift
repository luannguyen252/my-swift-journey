//
//  List_HeadAndFooters.swift
//  100Views
//
//  Created by Mark Moeykens on 6/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct List_HeadersAndFooters : View {
    var data = ["Evans", "Lemuel James Guerrero", "Mark", "Durtschi", "Chase", "Rodrigo"]
    var body: some View {
        List {
            Section(header: Header(), footer: Text("7 People on Staff")) {
                // ForEach will handle the row creation within the section
                ForEach(data, id: \.self) { datum in
                    NameRow(content: datum)
                }
            }
        }
        .ignoresSafeArea(edges: .all)
    }
}
// The views used for the header and footer
struct Header: View {
    var body: some View {
        Image("mountains")
            .ignoresSafeArea(edges: .top)
            .overlay(Text("STAFF")
                        .font(Font.system(size: 120, design: Font.Design.serif))
                        .foregroundColor(.green))
    }
}
struct NameRow: View {
    var content: String
    var body: some View {
        HStack {
            Image("PineTree").foregroundColor(Color.green)
            Text(content).font(.title)
            Spacer()
        }.padding()
    }
}

struct List_HeadersAndFooters_Previews : PreviewProvider {
    static var previews: some View {
        List_HeadersAndFooters()
    }
}
