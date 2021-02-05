//
//  MissionView.swift
//  MoonShot
//
//  Created by Sandesh on 30/04/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct MissionView: View {
     let mission: Mission
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let astronaut: [CrewMember]
    
    init(mission: Mission, astronaut: [Astronaut]) {
        self.mission = mission
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronaut.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        
        self.astronaut = matches
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                Image(self.mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: geo.size.width * 0.7)
                    .padding(.top)
                
                Text(self.mission.formattedDateString)
                    .padding(.horizontal)
                    .font(.system(size: 20, weight: Font.Weight.heavy))
                    .foregroundColor(.blue)
                
                Text(self.mission.description)
                .padding()
                
                ForEach(self.astronaut, id: \.role) { crewMember in
                    NavigationLink(destination: AstronautView(crewMember.astronaut)) {
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
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[2], astronaut: astronauts)
    }
}
