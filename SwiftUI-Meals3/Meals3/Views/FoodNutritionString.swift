//
//  FoodNutritionStringView.swift
//  Meals3
//
//  Created by Uwe Petersen on 16.11.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI

struct FoodNutritionString: View {
    
    var text: String = ""
    @Binding var value: String?
    @Binding var editingDisabled: Bool
    
    var body: some View {
        
        let valueAsString = Binding<String> (
            get: { self.value ?? "no name" },
            set: { self.value = $0 }
        )
        
        return HStack {
            Text(text)
            Spacer()
            
            if editingDisabled {
                Text(valueAsString.wrappedValue)
                    .lineLimit(nil)
            } else {
                TextField(text, text: valueAsString)
                    .multilineTextAlignment(.trailing)
                .foodInputFieldEditingModifier(editingDisabled: editingDisabled)
            }
            
        }
    }
}

struct FoodNutritionStringView_Previews: PreviewProvider {
    
    @State static private var string0: String? = "Kuhmilch 3,5% Fett"
    @State static private var string1: String? = "Weniger als 5% Fett (vollfett = 3.5 % Fett)"
    @State static private var string2: String? = "Milch und Sauermilch"
    @State static private var string3: String? = "Handelsüblich ohne Küchenabfall"

    static var previews: some View {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
//        let food: Food = {
//            let food = Food(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
//            food.name = "leckerer Donut"
//            food.comment = "Ein unnötiger Kommentar"
//            food.totalCarb = 12.0
//            food.totalFat = 23.0
//            food.totalProtein = 14.0
//            food.totalEnergyCals = 200.0
//            food.totalAlcohol = 4.0
//            food.totalWater = 55.0
//            food.totalDietaryFiber = 32.0
//            food.totalOrganicAcids = 0.4
//            food.totalSalt = 0.3
//            food.dateOfLastModification = Date()
//            food.carbGlucose = 12.0
//            return food
//        }()
        
        let _: Nutrient? = { // Store a nutrient in core data
            let nutrient = Nutrient(context: context)
            nutrient.dispUnit = "g"
            nutrient.key = "totalEnergyCals"
            nutrient.name = "Energie (Teststring)"
            //            try? context.save()
            return nutrient
        }()
        

        
        return NavigationView {
             VStack {
                FoodNutritionString(text: "Name", value: $string0, editingDisabled: .constant(true))
                 Divider()
                 FoodNutritionString(text: "Detail", value: $string1, editingDisabled: .constant(true))
                 Divider()
                 FoodNutritionString(text: "Untergr.", value: $string2, editingDisabled: .constant(true))
                 Divider()
                 FoodNutritionString(text: "Refer.", value: $string3, editingDisabled: .constant(true))
                 Divider()

             }.padding()
                .navigationBarTitle("Lebensmittelname")
        }
    }
}
