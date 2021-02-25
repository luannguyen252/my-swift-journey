//
//  List_FooterToRemoveLines.swift
//  100Views
//
//  Created by Mark Moeykens on 7/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct List_FooterToRemoveLines : View {
    var data = ["Evans", "Lemuel James Guerrero", "Mark"]
    
    var body: some View {
        List {
            Section(header: Header(), footer:
                // Use a Footer to remove lines after rows
                // NOTE: This solution no longer works
                Color.primary
//                    .listRowInsets(EdgeInsets(top: 0, leading: -8, bottom: 0, trailing: -8))
            ) {
                ForEach(data, id: \.self) { datum in
                    NameRow(content: datum)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#if DEBUG
struct List_FooterToRemoveLines_Previews : PreviewProvider {
    static var previews: some View {
        List_FooterToRemoveLines()
    }
}
#endif
