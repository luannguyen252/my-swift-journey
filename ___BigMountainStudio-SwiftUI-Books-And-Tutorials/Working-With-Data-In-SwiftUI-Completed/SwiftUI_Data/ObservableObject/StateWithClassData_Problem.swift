//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class CarData {
    var year = ""
    var make = ""
}

struct StateWithClassData_Problem: View {
    @State var carData = CarData()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Class Data", subtitle: "Working With Classes", desc: "What happens when you try to use a class with @State?",
                       back: .purple, textColor: .white)
            
            GroupBox(label: Text("Enter car make and model")) {
                TextField("car year", text: $carData.year)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("car make", text: $carData.make)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            Text("Car Information:")
            Text("\(carData.year) \(carData.make)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            DescView("The Text view no longer gets updated. How do you fix this?",
                     back: .purple, textColor: .white)
        }
        .font(.title)
    }
}

struct StateWithClassData_Problem_Previews: PreviewProvider {
    static var previews: some View {
        StateWithClassData_Problem()
    }
}
