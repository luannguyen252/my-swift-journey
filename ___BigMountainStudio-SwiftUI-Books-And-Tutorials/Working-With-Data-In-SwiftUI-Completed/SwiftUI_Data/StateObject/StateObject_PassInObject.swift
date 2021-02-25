//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct StateObject_PassInObject: View {
    // Make sure the property is public
    @StateObject var car: Car = Car(year: "", make: "")
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("StateObject",
                       subtitle: "Previewing",
                       desc: "You can also pass in an instantiated class to the @StateObject.", back: .green)
            
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


struct StateObject_PassInObject_Previews: PreviewProvider {
    static var toyota = Car(year: "2021", make: "Tacoma")
    static var tesla = Car(year: "2021", make: "Tesla")

    static var previews: some View {
        Group {
            StateObject_PassInObject(car: toyota)
                .previewLayout(.sizeThatFits)
            StateObject_PassInObject(car: tesla)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
