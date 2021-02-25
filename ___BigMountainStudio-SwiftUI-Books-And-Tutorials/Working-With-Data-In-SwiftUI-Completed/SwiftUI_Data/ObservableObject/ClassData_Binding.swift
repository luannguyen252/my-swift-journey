//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class CarInformation: ObservableObject { // Make into an observable object
    var year = ""
    var make = ""
}

struct ClassData_Binding: View {
    @StateObject var carInfo = CarInformation()
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView("Class Data", subtitle: "Binding To Classes", desc: "Step 1: Have your class conform to ObservableObject.\nStep 2: Assign it to a variable with the property wrapper @StateObject.",
                       back: .purple, textColor: .white)
            
            GroupBox(label: Text("Enter car make and model")) {
                TextField("car year", text: $carInfo.year)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("car make", text: $carInfo.make)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            Text("Car Information:")
            Text("\(carInfo.year) \(carInfo.make)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            DescView("Notice the Text view still isn't getting updated. There is a third step...", back: .purple, textColor: .white)
                .font(.title2)
        }
        .font(.title)
    }
}

struct ClassData_Binding_Previews: PreviewProvider {
    static var previews: some View {
        ClassData_Binding()
    }
}
