//
//  ContentView.swift
//  MoonShot
//
//  Created by Sandesh on 28/04/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var displayMode = false
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronaut: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading){
                        Text(mission.displayName)
                            .font(.headline)
                        Text(self.displayMode ? mission.formattedDateString : mission.crews)
                    }
                }
            }
            .navigationBarTitle("MoonShot")
            .navigationBarItems(trailing: Button("Toggle View") {
                self.displayMode.toggle()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
