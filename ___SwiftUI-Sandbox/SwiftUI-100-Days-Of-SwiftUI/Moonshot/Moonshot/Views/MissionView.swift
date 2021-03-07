//
//  MissionView.swift
//  Moonshot
//
//  Created by Nicholas Fox on 1/7/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct MissionView: View {

  struct CrewMember {
    let role: String
    let astronaut: Astronaut
  }

  init(mission: Mission, astronauts: [Astronaut], missions: [Mission]) {
    self.mission = mission
    self.missions = missions
    var matches: [CrewMember] = []

    mission.crew.forEach { member in
      guard let match = astronauts.first(where: { $0.id == member.name}) else { fatalError("Missing Astronaut \(member.name)") }
      matches.append(CrewMember(role: member.role, astronaut: match))
    }
    self.astronauts = matches
  }

  let mission: Mission
  let astronauts: [CrewMember]
  let missions: [Mission]

  var body: some View {
    GeometryReader { geo in
      ScrollView {
        VStack {
          Image(self.mission.imageName)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geo.size.width * 0.6)
            .padding(.top)

          Text(self.mission.formattedLaunchDate)
            .padding()

          Text(self.mission.description)
            .padding()

          ForEach(self.astronauts, id: \.role) { crewMember in
            NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut, missions: self.missions)) {
              HStack {
                Image(crewMember.astronaut.id)
                  .resizable()
                  .frame(width: 83, height: 60)
                  .clipShape(Capsule())
                  .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                VStack(alignment: .leading) {
                  Text(crewMember.astronaut.name)
                    .font(.headline)
                  Text(crewMember.role)
                    .foregroundColor(.secondary)
                }
                Spacer()
              }
              .padding(.horizontal)
            }
            .buttonStyle(PlainButtonStyle())
          }

          Spacer(minLength: 25)
        }
      }
    }
    .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
  }
}

struct MissionView_Previews: PreviewProvider {

  static let missions: [Mission] = Bundle.main.decode("missions.json")
  static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

  static var previews: some View {
    MissionView(mission: missions[0], astronauts: astronauts, missions: missions)
  }
}
