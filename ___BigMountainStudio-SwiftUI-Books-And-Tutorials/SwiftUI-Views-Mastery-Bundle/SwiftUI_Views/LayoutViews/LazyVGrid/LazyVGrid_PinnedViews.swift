//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyVGrid_PinnedViews: View {
    @State private var teams = Data.getTeams()
    
    var body: some View {
        VStack(spacing: 15) {
            HeaderView("LazyVGrid",
                       subtitle: "Pinned Views",
                       desc: "LazyVGrids can also have section headers and section footers that can be pinned so they only scroll when the next header/footer comes.")
            
            let cols = [GridItem(.adaptive(minimum: 100, maximum: 200))]
            
            ScrollView {
                LazyVGrid(columns: cols, pinnedViews: [.sectionHeaders, .sectionFooters]) {
                    ForEach(teams) { team in
                        Section(header: TeamHeaderVGridView(team: team),
                                footer: TeamFooterVGridView(team: team)) {
                            ForEach(team.people) { person in
                                Image("\(person.imageName)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
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

struct LazyVGrid_PinnedViews_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid_PinnedViews()
    }
}

struct TeamHeaderVGridView: View {
    var team: Data.Team
    
    var body: some View {
        HStack(spacing: 8) {
            Spacer()
            Text("Team")
                .font(.largeTitle)
            Image(systemName: team.imageName)
                .font(.largeTitle)
            Spacer()
        }
        .frame(height: 75)
        .background(Rectangle()
                        .fill(Color.yellow)
                        .opacity(0.9))
    }
}

struct TeamFooterVGridView: View {
    var team: Data.Team

    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            Text("Team Total: ")
                .font(.title)
            Text("\(team.people.count)")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .frame(height: 60)
        .background(Rectangle().fill(Color.yellow).opacity(0.9))
    }
}
