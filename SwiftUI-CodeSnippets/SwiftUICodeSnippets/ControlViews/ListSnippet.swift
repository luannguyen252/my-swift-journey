//
//  ListSnippet.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct ListSnippet: View {
    let array = ["Placeholder 1", "Placeholder 2"]
    
    var body: some View {
        List {
            Section(header:
                        Text("Header")
                        .font(.title)
                        .bold(),
                    footer:
                        Text("Footer")
                        .font(.footnote)) {
                ForEach(array, id: \.self) { data in
                    Text(data)
                }
            }
        }
    }
}

#if DEBUG
struct ListSnippet_Previews: PreviewProvider {
    static var previews: some View {
        ListSnippet()
    }
}
#endif
