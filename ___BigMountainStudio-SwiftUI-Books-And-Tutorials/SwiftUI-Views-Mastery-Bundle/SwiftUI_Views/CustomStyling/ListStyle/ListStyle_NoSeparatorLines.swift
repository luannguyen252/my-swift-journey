//
//  ListStyle_NoSeparatorLines.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ListStyle_NoSeparatorLines: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("List").font(.largeTitle)
            Text("No Separator Lines").foregroundColor(.gray)
            Text("Although not a ListStyle, you can create a ViewModifier to apply to a List. This view modifier removes the separator lines from a list.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(.white)
            
            List {
                Text("Line One")
                Text("Line Two")
                Text("Line Three")
            }.modifier(ListSeparatorStyleNoneModifier())
        }.font(.title)
    }
}

// Credit goes to Vatsol Manot for this idea
// When the list appears, remove the lines from table views
// When the list disappears, add lines back to table views
public struct ListSeparatorStyleNoneModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.onAppear {
            UITableView.appearance().separatorStyle = .none
        }.onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
}

struct ListStyle_NoSeparatorLines_Previews: PreviewProvider {
    static var previews: some View {
        ListStyle_NoSeparatorLines()
    }
}
