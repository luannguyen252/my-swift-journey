//
//  ExampleList.swift
//  SwiftUIMarkdownUI
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct ExampleList: View {
    @State private var selection: Example?

    let examples: [Example]

    var body: some View {
        List(selection: $selection) {
            ForEach(examples) { example in
                NavigationLink(
                    destination: ExampleView(example: example),
                    tag: example,
                    selection: $selection
                ) {
                    Text(example.title)
                }
                .tag(example)
            }
            NavigationLink("All", destination: AllExamplesView(examples: Example.all))
        }
        .navigationTitle("Markdown Examples")
    }
}

struct ExampleList_Previews: PreviewProvider {
    static var previews: some View {
        ExampleList(examples: Example.all)
    }
}
