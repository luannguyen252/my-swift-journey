//
//  FoodNumberCellWithKey.swift
//  Meals3
//
//  Created by Uwe Petersen on 01.12.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI

struct FoodNumberTextFieldWithKey: View {
    
    // TODO: testen und vergleichen, insbesondere, wie oft etwas aufgerufen wird. (Ggf. auch Rechenleistung durch ForEach mit 100.000 Elementen oder so.
    // a.) Wie hier mit Aniview
    // b.) Mit @State private var nutrient: Nutrient? = nil und Inintialisierung in .onAppear von SwiftUI.Group{}
    // c.) Versuche mit lazy, falls das geht
    // d.) Function die AnyView zurück gibt und allen Code enthält und in "some" aufgerufen wird. OnAppear kann dann dran angehängt werden. Group braucht es nicht dazu.
    // e.) Zwei mal hart statt nutrient im Code einfach direkt Nutrient.nutrientForKey... schreiben. Dann wird das Nutrient eben zwei mal aufgerufen. Müsste funktionieren, aber viel Zeit brauchen.
    // Das ganze auch mit nil testen. Muss im preview gemacht werden, dazu ein food und ein Nutrient erzeugen.

    @Environment(\.managedObjectContext) var viewContext
    @Binding var editingDisabled: Bool
    @ObservedObject var food: Food
    var key: String
    var numberFormatter: NumberFormatter = NumberFormatter()
    
    var body: some View {
        
        let value: Binding<NSNumber?> = Binding(
            get: {self.food.value(forKey: self.key) as? NSNumber ?? nil},
            set: {self.food.setValue($0, forKey: self.key)}
        )
        
        if let nutrient = Nutrient.nutrientForKey(key, inManagedObjectContext: self.viewContext) {

            return AnyView( HStack {
                Text(nutrient.name ?? "no name given")
                Spacer()

                SwiftUI.Group {
                    NSNumberTextField(label: "", value: value, formatter: numberFormatter)
                    Text(nutrient.hkDispUnitText)
                }
                .foodInputFieldEditingModifier(editingDisabled: editingDisabled)

            })
        } else {
            return AnyView( HStack {
                Text("no name given")
            })
        }
    }
}


struct FoodInputFieldEditingModifier: ViewModifier {
    var editingDisabled: Bool = true
    
    func body(content: Content) -> some View {
        
        if editingDisabled {
            return AnyView (
                content
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor((Color(.secondaryLabel)))
                    .disabled(editingDisabled)
            )
        } else {
            return AnyView(
                content
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(editingDisabled)
            )
        }
    }
}

extension View {
    func foodInputFieldEditingModifier(editingDisabled: Bool) -> some View {
        modifier(FoodInputFieldEditingModifier(editingDisabled: editingDisabled))
    }
}


struct FoodNumberCellWithKey_Previews: PreviewProvider {

    static var title = String(#file.split(separator: "/").last ?? "file not found")
    @State static var isDisabled: Bool = false

    static var previews: some View {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let food: Food = {
            let food = Food(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
            food.name = "leckerer Donut"
            food.comment = "Ein unnötiger Kommentar"
            food.totalCarb = 12.0
            food.totalFat = 23.0
            food.totalProtein = 14.0
            food.totalEnergyCals = 200.0
            food.totalAlcohol = 4.0
            food.totalWater = 55.0
            food.totalDietaryFiber = 32.0
            food.totalOrganicAcids = 0.4
            food.totalSalt = 0.3
            food.dateOfLastModification = Date()
            food.carbGlucose = 12.0
            
            return food
        }()
        
        let _: Nutrient? = { // Store a nutrient in core data
            let nutrient = Nutrient(context: context)
            nutrient.dispUnit = "g"
            nutrient.key = "totalEnergyCals"
            nutrient.name = "Energie (Teststring)"
//            try? context.save()
            return nutrient
        }()

        return NavigationView {
            Form {
                FoodNumberTextFieldWithKey(editingDisabled: $isDisabled, food: food, key: "totalEnergyCals", numberFormatter: NumberFormatter())
                    .environment(\.managedObjectContext, context)
                    .navigationBarTitle(food.name ?? "no name given")
            }
        }
    }
}
