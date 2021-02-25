//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct DisclosureGroup_ListInside: View {
    @State var stories = ["Origin Story", "New York 1979", "Girl in the Woods", "Life at the end of the World", "It's Not What You Know", "Specifically Not That", "Mister with a Sister", "Origin Story", "New York 1979", "Girl in the Woods", "Life at the end of the World", "It's Not What You Know", "Specifically Not That", "Mister with a Sister","Origin Story", "New York 1979", "Girl in the Woods", "Life at the end of the World", "It's Not What You Know", "Specifically Not That", "Mister with a Sister"]
    
    var body: some View {
        NavigationView () {
            List {
                DisclosureGroup(
                    content: {
                        List (stories, id: \.self) { story in
                            Text(story)
                        }
                        .frame(height: (CGFloat(stories.count) * 44))
                    },
                    label: {
                        HStack(spacing: 20) {
                            Image(systemName: "books.vertical.fill")
                            Text("Stories")
                        }
                    })
            }
            .navigationTitle("Story List")
        }
    }
}

struct DisclosureGroup_ListInside_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroup_ListInside()
    }
}
