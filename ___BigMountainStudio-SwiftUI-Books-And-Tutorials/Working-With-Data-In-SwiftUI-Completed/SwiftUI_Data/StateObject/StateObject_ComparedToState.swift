//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct StateObject_ComparedToState: View {
    // Car is a class
    @State private var car = Car(year: "2022", make: "Honda")
    
    var body: some View {
        VStack {
            HeaderView("StateObject",
                       subtitle: "Compared to State",
                       desc: "If you try to use @State with a class, it won't provide two-way binding.", back: .green)
            Text("\(car.year) \(car.make)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            VStack {
                TextField("year", text: $car.year)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("year", text: $car.make)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            
            DescView("@StateObject is just for binding to classes, not structs.", back: .green)
        }
        .font(.title)
    }
}

struct StateObject_ComparedToState_Previews: PreviewProvider {
    static var previews: some View {
        StateObject_ComparedToState()
    }
}
