//
//  Form_RowInset.swift
//  100Views
//
//  Created by Mark Moeykens on 6/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Form_ListRowInset : View {
    var body: some View {
        Form {
            Section(header: Text("Form").font(.largeTitle)) {
                Text("List Row Inset")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("Using this color, you can see where the default margins are:")
                Color.purple
                Text("You can use the List Row Inset modifier to adjust the margins:")
                Color.purple
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            Section(header: Text("Row Inset Uses")
                .font(.title).foregroundColor(.gray)) {
                    Text("Other possible uses could be for indenting")
                    Text("Indent Level 1")
                        .listRowInsets(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                    Text("Indent Level 2")
                        .listRowInsets(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 0))
                    Text("Or Vertical Alignment")
                    Text("Top")
                        .listRowInsets(EdgeInsets(top: -20, leading: 40, bottom: 0, trailing: 0))
                    Text("Bottom")
                        .listRowInsets(EdgeInsets(top: 20, leading: 40, bottom: 0, trailing: 0))
            }
        }
    }
}

struct Form_ListRowInset_Previews : PreviewProvider {
    static var previews: some View {
        Form_ListRowInset()
    }
}
