//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyHStack_HeadersFooters: View {
    @State private var teams = Data.getTeams()

    var body: some View {
        VStack(spacing: 10.0) {
            HeaderView("LazyHStack",
                       subtitle: "Headers & Footers",
                       desc: "Using the Section view, you can add a header and footer inside a LazyHStack.")
            
            Spacer()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 5) {
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

struct LazyHStack_HeadersFooters_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStack_HeadersFooters()
    }
}

struct TeamHeaderView: View {
    var team: Data.Team
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Team")
                .font(.title2)
            Image(systemName: team.imageName)
                .font(.system(size: 50))
        }
        .frame(width: 75, height: 100)
        .background(Rectangle().fill(Color.yellow).opacity(0.9))
        .padding(.bottom, 8)
    }
}

struct TeamFooterView: View {
    var team: Data.Team

    var body: some View {
        VStack(spacing: 0) {
            Text("Total")
                .font(.title2)
            Text("\(team.people.count)")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(width: 60, height: 100)
        .background(Rectangle().fill(Color.yellow).opacity(0.9))
        .padding(.bottom, 8)
    }
}
