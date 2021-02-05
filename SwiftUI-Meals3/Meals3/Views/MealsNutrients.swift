//
//  MealsNutrientsView.swift
//  Meals3
//
//  Created by Uwe Petersen on 10.11.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI


// Formatters only created once by putting them here

fileprivate let dateFormatter: DateFormatter = {
//    print("DateFormatter")
    let dateFormatter = DateFormatter()
//    let template = "EEEEyMMMMdHHmm"
    let template = "EEEEyMMMdHHmm"
    dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: Locale.current)!

    return dateFormatter
}()

fileprivate let numberFormatter: NumberFormatter = {
//    print("numberFormatter")
    return NumberFormatter()
}()


/// Shows nutrient compremension data for a meal.
///
/// Example data is
///
/// `"11. Jan 2020 at 13:51"`
/// `"35 g KH  und 2 FPE"`
struct MealsNutrients: View, Equatable {
    @ObservedObject var meal: Meal
    
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var currentMeal: CurrentMeal
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("\(meal.dateOfCreation ?? Date(), formatter: dateFormatter)")
                Text("\(reducedNutrientString(meal: meal))")
            }
            .font(.headline)
            Spacer()
            Button(action: { withAnimation{ self.copyMeal() } },
                   label: { Image(systemName: "doc.on.doc").padding(.leading)
            })
        }
    }
    
    static func == (lhs: MealsNutrients, rhs: MealsNutrients) -> Bool {
//        print("Using equatable on MealNutriensView")
        return lhs.meal.dateOfCreation == rhs.meal.dateOfCreation && lhs.meal.dateOfLastModification == rhs.meal.dateOfLastModification
    }

    func reducedNutrientString(meal: Meal) -> String {
//        print("MealNutrients viev func reducedutrientString(meal:): \(String(describing: meal.description))")
        let totalCarb    = Nutrient.dispStringForNutrientWithKey("totalCarb",    value: meal.doubleForKey("totalCarb"), formatter: numberFormatter, inManagedObjectContext: viewContext) ?? ""
        return String("\(totalCarb) KH  und   \(numberFormatter.string(from: NSNumber(value: meal.fpu ?? 0.0)) ?? "") FPE  (\(numberFormatter.string(from: NSNumber(value: meal.fpuFalse ?? 0.0)) ?? "") FPE)")
    }
    
    /// Create copy of this meal an dismiss the view
    func copyMeal() {
        debugPrint("Will copy the meal \(meal) and make it the new current meal")
        if let newMeal = Meal.fromMeal(meal, inManagedObjectContext: viewContext) {
            HealthManager.synchronize(newMeal, withSynchronisationMode: .save)
            currentMeal.meal = Meal.newestMeal(managedObjectContext: viewContext)
            try? viewContext.save()
        }
    }
    
}




//#if DEBUG
struct MealNutrientsView_Previews: PreviewProvider {

    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
        return MealsNutrients(meal: Meal(context: context)).environment(\.managedObjectContext, context)

    }
}
//#endif
