//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyVStack_PinnedViews: View {
    @State private var teams = Data.getTeams()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("LazyVStack",
                       subtitle: "Pinned Views",
                       desc: "LazyVStacks can also have section headers and section footers that can be pinned so they only scroll when the next header/footer comes.")
            
            ScrollView {
                LazyVStack(spacing: 5, pinnedViews: [.sectionHeaders, .sectionFooters]) {
                    ForEach(teams) { team in
                        Section(header: TeamVerticalHeaderView(team: team),
                                footer: TeamVerticalFooterView(team: team)) {
                            ForEach(team.people) { person in
                                Image("\(person.imageName)")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                            }
                        }
                    }
                }
            }
            Spacer()
        }
        .font(.title)
    }
}

struct LazyVStack_PinnedViews_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStack_PinnedViews()
    }
}
