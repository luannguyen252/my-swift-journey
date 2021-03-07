//
//  AstronautView.swift
//  Moonshot
//
//  Created by Nicholas Fox on 1/7/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct AstronautView: View {

  let astronaut: Astronaut
  let missions: [Mission]

  init(astronaut: Astronaut, missions: [Mission]) {
    self.astronaut = astronaut
    self.missions = missions.filter({ mission in
      mission.crew.contains { $0.name == astronaut.id }
    })
  }

  var body: some View {
    GeometryReader { geo in
      ScrollView(.vertical) {
        Image(self.astronaut.id)
          .resizable()
          .scaledToFit()
          .frame(width: geo.size.width)

        Text(self.astronaut.description)
          .padding()
          .layoutPriority(1)

        HStack {
          Text("Missions:")
          Spacer()
        }
        .padding()

        ForEach(self.missions) { mission in
          HStack {
            Image(mission.imageName)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 44, height: 44)

            VStack(alignment: .leading) {
              Text(mission.displayName)
                .font(.headline)
              Text(mission.formattedLaunchDate)
            }

            Spacer()
          }
          .padding()
        }
      }
    }
    .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
  }
}

struct AstronautView_Previews: PreviewProvider {

  static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  static let missions: [Mission] =
    Bundle.main.decode("missions.json")

  static var previews: some View {
    AstronautView(astronaut: astronauts[0], missions: missions)
  }
}
