//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class CarInfo: ObservableObject {
    @Published var year = ""
    @Published var make = ""
}

struct ClassData_Solution: View {
    @StateObject var carInfo = CarInfo()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Class Data", subtitle: "Publishing Your Properties", desc: "The last thing that needs to be done is to publish the variables from your data class so bound views will receive any changed data.",
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
            
            DescView("And now it works! This is a two-way bind.",
                     back: .purple, textColor: .white)
        }
        .font(.title)
    }
}

struct ClassData_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ClassData_Solution()
    }
}
