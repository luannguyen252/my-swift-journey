//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyVStack_WithScrolling: View {
    @State private var teams = Data.getTeams()

    var body: some View {
        VStack(spacing: 10.0) {
            HeaderView("LazyVStack",
                       subtitle: "With ScrollView",
                       desc: "The LazyVStack is best used with many views that scroll off the screen. \"Lazy\" means views off the screen are not created unless shown. This increases performance.")
            
            
            ScrollView {
                LazyVStack(spacing: 5) {
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

struct LazyVStack_WithScrolling_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStack_WithScrolling()
    }
}

struct TeamVerticalHeaderView: View {
    var team: Data.Team
    
    var body: some View {
        HStack {
            Text("Team")
                .font(.largeTitle)
            Image(systemName: team.imageName)
                .font(.largeTitle)
        }
        .frame(width: 300, height: 75)
        .background(Rectangle().fill(Color.yellow).opacity(0.9))
    }
}

struct TeamVerticalFooterView: View {
    var team: Data.Team

    var body: some View {
        HStack {
            Text("Team Total: ")
                .font(.title)
            Text("\(team.people.count)")
                .font(.title)
                .fontWeight(.bold)
        }
        .frame(width: 300, height: 50)
        .background(Rectangle().fill(Color.yellow).opacity(0.9))
    }
}
