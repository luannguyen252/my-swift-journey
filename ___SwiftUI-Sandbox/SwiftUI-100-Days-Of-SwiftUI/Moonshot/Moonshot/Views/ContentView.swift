//
//  ContentView.swift
//  Moonshot
//
//  Created by Nicholas Fox on 1/6/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct ContentView: View {

  let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  let missions: [Mission] = Bundle.main.decode("missions.json")

  @State private var isShowingCrew = false

  var body: some View {

    NavigationView {
      List(missions) { mission in
        NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts, missions: self.missions)) {

          Image(mission.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 44, height: 44)

          VStack(alignment: .leading) {
            Text(mission.displayName)
              .font(.headline)
            if !self.isShowingCrew {
              Text(mission.formattedLaunchDate)
            }

            if self.isShowingCrew {
              ForEach(mission.crew, id: \Mission.CrewRole.name) { crew in
                self.astronaut(id: crew.name).map { Text($0.name) }
              }
            }
          }
        }
      }
      .navigationBarItems(trailing:
        Button(
          action: { self.isShowingCrew.toggle() },
          label: {
            if self.isShowingCrew {
              Text("Show Launch Dates")
            } else {
              Text("Show Crew")
            }
          })
      )
      .navigationBarTitle("Moonshot")
    }
  }

  func astronaut(id: String) -> Astronaut? {
    return astronauts.first(where: { $0.id == id })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
