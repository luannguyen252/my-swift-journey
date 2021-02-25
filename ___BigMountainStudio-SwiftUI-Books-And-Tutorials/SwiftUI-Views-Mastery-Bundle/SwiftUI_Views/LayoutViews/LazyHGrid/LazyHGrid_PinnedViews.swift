//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyHGrid_PinnedViews: View {
    @State private var teams = Data.getTeams()
    
    var body: some View {
        VStack(spacing: 15) {
            HeaderView("LazyHGrid",
                       subtitle: "Pinned Views",
                       desc: "LazyHGrids can also have section headers and section footers that can be pinned so they only scroll when the next header/footer comes.")
                .layoutPriority(1)
            
            let rows = [GridItem(.adaptive(minimum: 150, maximum: 300))]
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, pinnedViews: [.sectionHeaders, .sectionFooters]) {
                    ForEach(teams) { team in
                        Section(header: TeamHeaderHGridView(team: team),
                                footer: TeamFooterHGridView(team: team)) {
                            ForEach(team.people) { person in
                                Image("\(person.imageName)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                        }
                    }
                }
            }
        }
        .font(.title)
    }
}

struct LazyHGrid_PinnedViews_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGrid_PinnedViews()
    }
}

struct TeamHeaderHGridView: View {
    var team: Data.Team
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            Text("Team")
                .font(.title2)
            Image(systemName: team.imageName)
                .font(.system(size: 50))
            Spacer()
            Spacer()
        }
        .frame(width: 75)
        .background(Rectangle()
                        .fill(Color.yellow)
                        .opacity(0.9))
    }
}

struct TeamFooterHGridView: View {
    var team: Data.Team

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("Total")
                .font(.title2)
            Text("\(team.people.count)")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Spacer()
        }
        .frame(width: 60)
        .background(Rectangle()
                        .fill(Color.yellow)
                        .opacity(0.9))
    }
}
