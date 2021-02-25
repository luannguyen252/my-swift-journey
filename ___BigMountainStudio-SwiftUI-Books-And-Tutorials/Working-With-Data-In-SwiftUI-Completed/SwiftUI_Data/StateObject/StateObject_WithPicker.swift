//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class CarChoices: ObservableObject {
    @Published var cars: [String] = [""]
    @Published var selectedCar = ""
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            cars = ["Audi", "Honda", "Mazda", "Tesla", "Toyota"]
            selectedCar = cars[2]
        }
    }
}

struct StateObject_WithPicker: View {
    @StateObject private var carChoices = CarChoices()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("StateObject",
                       subtitle: "With Picker",
                       desc: "Here's an example of binding a @StateObject property to a Picker.", back: .green)
            Text("Select a car")
            Picker(selection: $carChoices.selectedCar, label: Text("Picker")) {
                ForEach(carChoices.cars, id: \.self) { car in
                    Text(car).tag(car)
                }
            }.background(Color.green.cornerRadius(20).opacity(0.3))
            Text("You selected a: ")
                + Text(carChoices.selectedCar).bold().foregroundColor(.green)
            
        }
        .font(.title)
    }
}

struct StateObject_WithPicker_Previews: PreviewProvider {
    static var previews: some View {
        StateObject_WithPicker()
    }
}
