//
//  AstronautView.swift
//  MoonShot
//
//  Created by Sandesh on 30/04/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let missionAttended: [Mission]
    init(_ astronaut: Astronaut) {
        self.astronaut = astronaut
        var missionAttn = [Mission]()
        missions.forEach { mission in
            if mission.crew.contains(where: { crew in crew.name == astronaut.id}) {
                missionAttn.append(mission)
            }
        }
        missionAttended = missionAttn
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    .layoutPriority(1)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text("Missions Attended")
                        .fontWeight(.bold)
                        .font(.headline)
                    
                    ForEach(self.missionAttended) { mission in
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .frame(width: 44, height: 44)
                            
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .fontWeight(.bold)
                                Text(mission.formattedDateString)
                                    .foregroundColor(.secondary)
                                
                            }
                            Spacer()
                        }.padding(.horizontal)
                    }
                }
                
                
            }
        }
            
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions:[Mission] = Bundle.main.decode("missions.org")
    static var previews: some View {
        AstronautView(astronauts[0])
    }
}
