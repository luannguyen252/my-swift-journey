//
//  AstronautView.swift
//  Moonshot
//
//  Created by Juan Francisco Dorado Torres on 28/11/20.
//

import SwiftUI

struct AstronautView: View {
  let astronaut: Astronaut
  let missions: [Mission]

  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical) {
        VStack {
          Image(self.astronaut.id)
            .resizable()
            .scaledToFit()
            .frame(width: geometry.size.width)

          Text(self.astronaut.description)
            .padding()
            .layoutPriority(1)

          Divider()

          Text("Missions he has participed")
            .font(.headline)
            .padding()

          ForEach(self.missions, id: \.id) { mission in
            HStack {
              Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)

              VStack(alignment: .leading) {
                Text(mission.displayName)
                Text(mission.formattedLaunchDate)
                  .foregroundColor(.secondary)
              }

              Spacer()
            }
            .padding(.horizontal)
          }
        }
      }
    }
    .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
  }

  init(astronaut: Astronaut) {
    self.astronaut = astronaut

    var missionMatches: [Mission] = []
    let allMissions: [Mission] = Bundle.main.decode("missions.json")

    for mission in allMissions {
      for member in mission.crew where astronaut.name.lowercased().contains(member.name) {
        missionMatches.append(mission)
      }
    }

    self.missions = missionMatches
  }
}

struct AstronautView_Previews: PreviewProvider {
  static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

  static var previews: some View {
    AstronautView(astronaut: astronauts[0])
  }
}
