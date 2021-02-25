//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyHStack_PinnedViews: View {
    @State private var teams = Data.getTeams()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("LazyHStack",
                       subtitle: "Pinned Views",
                       desc: "LazyHStacks can also have section headers and section footers that can be pinned so they only scroll when the next header/footer comes.")
            
            Spacer()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 5, pinnedViews: [.sectionHeaders, .sectionFooters]) {
                    ForEach(teams) { team in
                        Section(header: TeamHeaderView(team: team),
                                footer: TeamFooterView(team: team)) {
                            ForEach(team.people) { person in
                                Image("\(person.imageName)")
                                    .resizable()
                                    .frame(width: 100)
                                    .padding(.bottom, 8)
                            }
                        }
                    }
                }
            }
            .frame(height: 108)
            
            Spacer()
        }
        .font(.title)
    }
}



struct LazyHStack_PinnedViews_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStack_PinnedViews()
    }
}
