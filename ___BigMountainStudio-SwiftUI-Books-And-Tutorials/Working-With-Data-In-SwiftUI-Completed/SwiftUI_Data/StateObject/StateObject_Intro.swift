//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class Car: ObservableObject {
    @Published var year: String
    @Published var make: String
    
    init(year: String, make: String) {
        self.year = year
        self.make = make
    }
}

struct StateObject_Intro: View {
    @StateObject private var car = Car(year: "2020", make: "Honda")
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("StateObject",
                       subtitle: "Introduction",
                       desc: "Use the @StateObject property wrapper for two-way binding between a class and your UI.", back: .green)
            
            Text("\(car.year) \(car.make)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            VStack {
                TextField("year", text: $car.year)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("year", text: $car.make)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()

        }
        .font(.title)
    }
}

struct StateObject_Intro_Previews: PreviewProvider {
    static var previews: some View {
        StateObject_Intro()
    }
}
