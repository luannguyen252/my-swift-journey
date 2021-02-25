//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import Foundation
import SwiftUI

class Data {
    struct Team: Identifiable {
        var id = UUID() // Give each profile a unique identifier
        var name = ""
        var imageName = ""
        var people: [Profile]
    }
    
    struct Profile: Identifiable {
        var id = UUID() // Give each profile a unique identifier
        var name = ""
        var imageName = ""
    }
    
    static func getProfiles() -> [Profile] {
        return [
            Profile(name: "Ahmere Budniewski", imageName: "profile1"),
            Profile(name: "Deston Jared Daniel Mark Shiozaki", imageName: "profile2"),
            Profile(name: "John Marinelarena", imageName: "profile3"),
            Profile(name: "Payce Portnoy", imageName: "profile4"),
            Profile(name: "Alea Polisky", imageName: "profile5"),
            Profile(name: "Dariela Valentina", imageName: "profile6"),
            Profile(name: "Hambi Dannibale", imageName: "profile7"),
            Profile(name: "Tiffanie Checchi", imageName: "profile8"),
            Profile(name: "Syerra Mariucci", imageName: "profile9"),
            Profile(name: "Evan Boegler", imageName: "profile10"),
            Profile(name: "Jason Taback", imageName: "profile11"),
            Profile(name: "Riana Kubas", imageName: "profile12"),
            Profile(name: "Surya Verdesoto", imageName: "profile13"),
            Profile(name: "Hannah Bonnet", imageName: "profile14"),
            Profile(name: "Ashlae Holzemer", imageName: "profile15"),
            Profile(name: "Raunak Bohlke", imageName: "profile16"),
            Profile(name: "Marico Seah", imageName: "profile17"),
            Profile(name: "Evonne Champaign", imageName: "profile18"),
            Profile(name: "Zacarias Lebaron", imageName: "profile19"),
            Profile(name: "Miguel Schoenecker", imageName: "profile20")
        ]
    }
    
    static func getTeams() -> [Team] {
        return [
            Team(name: "Team 1", imageName: "1.square.fill", people: [
                Profile(name: "Ahmere Budniewski", imageName: "profile1"),
                Profile(name: "Deston Shiozaki", imageName: "profile2"),
                Profile(name: "John Marinelarena", imageName: "profile3"),
                Profile(name: "Payce Portnoy", imageName: "profile4"),
                Profile(name: "Alea Polisky", imageName: "profile5"),
                Profile(name: "Dariela Valentina", imageName: "profile6"),
                Profile(name: "Hambi Dannibale", imageName: "profile7"),
                Profile(name: "Tiffanie Checchi", imageName: "profile8"),
                Profile(name: "Syerra Mariucci", imageName: "profile9"),
                Profile(name: "Evan Boegler", imageName: "profile10"),
                Profile(name: "Jason Taback", imageName: "profile11"),
                Profile(name: "Riana Kubas", imageName: "profile12"),
            ]),
            
            Team(name: "Team 2", imageName: "2.square.fill", people: [
                Profile(name: "Surya Verdesoto", imageName: "profile13"),
                Profile(name: "Hannah Bonnet", imageName: "profile14"),
                Profile(name: "Ashlae Holzemer", imageName: "profile15"),
                Profile(name: "Raunak Bohlke", imageName: "profile16"),
                Profile(name: "Marico Seah", imageName: "profile17"),
                Profile(name: "Evonne Champaign", imageName: "profile18"),
                Profile(name: "Zacarias Lebaron", imageName: "profile19"),
                Profile(name: "Miguel Schoenecker", imageName: "profile20")
            ])
        ]
    }
}
