//
//  MealDetailView.swift
//  Meals3
//
//  Created by Uwe Petersen on 29.12.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI

fileprivate let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

fileprivate let formatter: NumberFormatter =  {() -> NumberFormatter in
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = NumberFormatter.Style.decimal
    numberFormatter.maximumFractionDigits = 1
    numberFormatter.roundingMode = NumberFormatter.RoundingMode.halfUp
    numberFormatter.zeroSymbol = "0"
    return numberFormatter
}()

fileprivate let calsNumberFormatter: NumberFormatter =  {() -> NumberFormatter in
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = NumberFormatter.Style.none
    numberFormatter.zeroSymbol = "0"
    return numberFormatter
}()

fileprivate let zeroMaxDigitsNumberFormatter: NumberFormatter =  {() -> NumberFormatter in
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = NumberFormatter.Style.none
    numberFormatter.zeroSymbol = "0"
    return numberFormatter
}()



struct MealDetailView: View {
    @ObservedObject var meal: Meal
    
    @EnvironmentObject var currentMeal: CurrentMeal
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        
        let date = Binding<Date>(
            get: {self.meal.dateOfCreation ?? Date()},
            set: {
                self.meal.dateOfCreation = $0
                self.meal.dateOfLastModification = Date()
//                self.currentMeal.meal = Meal.newestMeal(managedObjectContext: self.viewContext)
                HealthManager.synchronize(self.meal, withSynchronisationMode: .update)
        })
        
        return VStack {
            Form {
                Section(header: Text("Datum und Kommentar"),
                        footer: HStack {
                            Spacer()
                            Text("Letzte Änderung am \(self.dateString(date: self.meal.dateOfLastModification))")
                    }) { DatePicker("Datum:", selection: date) }
                
                Section {
                    HStack {
                        Spacer()
                        Text("\(reducedNutrientString(meal: meal))")
                            .font(.headline)
                        Spacer()
                    }
                }
                
                Section(header: headerView(), footer: footerView()) {
                    MealDetailIngredients(meal: meal)
                }
            }
            MealDetailToolbar(meal: meal)
        }
        .navigationBarTitle("Mahlzeit-Details")
        .navigationBarItems(trailing: EditButton().padding())
        .onDisappear(){
//            print("MealDetailView disappeared.")
            if self.viewContext.hasChanges {
                try? self.meal.managedObjectContext?.save()
//                self.currentMeal.meal = Meal.newestMeal(managedObjectContext: self.viewContext)
            }
        }
        .onAppear() {
//            print("MealDetaliView appeared.")
            self.currentMeal.meal = self.meal
        }
    }
    
    @ViewBuilder func headerView() -> some View {
        Text(mealNutrientsString(meal: currentMeal.meal))
    }
    
    @ViewBuilder func footerView() -> some View {
        HStack {
            Spacer()
            Text("\(meal.ingredients?.count ?? 0) Zutaten, insgesamt \(amountString(meal: currentMeal.meal)) g")
        }
    }
    
    func amountString(meal: Meal) -> String {
        if let amount = meal.amount {
            return zeroMaxDigitsNumberFormatter.string(from: amount) ?? ""
        }
        return ""
    }
    
    func reducedNutrientString(meal: Meal?) -> String {
        if let meal = meal {
            let totalCarb    = Nutrient.dispStringForNutrientWithKey("totalCarb",    value: meal.doubleForKey("totalCarb"),    formatter: zeroMaxDigitsNumberFormatter, inManagedObjectContext: viewContext) ?? ""
            var fpu = 0.0
            if let protein = meal.doubleForKey("totalProtein"), let fat = meal.doubleForKey("totalFat") {
                fpu = (9.0 * protein + 4.0 * fat) / 100.0 / 1000.0
            }

            return String("\(totalCarb) KH  und   \(formatter.string(from: NSNumber(value: fpu)) ?? "") FPE")
        }
        return ""
    }
    
    func mealNutrientsString(meal: Meal?) -> String {
        if let meal = meal {
            let totalEnergyCals = Nutrient.dispStringForNutrientWithKey("totalEnergyCals", value: meal.doubleForKey("totalEnergyCals"), formatter: calsNumberFormatter, inManagedObjectContext: viewContext) ?? ""
            let totalCarb    = Nutrient.dispStringForNutrientWithKey("totalCarb",    value: meal.doubleForKey("totalCarb"),    formatter: zeroMaxDigitsNumberFormatter, inManagedObjectContext: viewContext) ?? ""
            let totalProtein = Nutrient.dispStringForNutrientWithKey("totalProtein", value: meal.doubleForKey("totalProtein"), formatter: zeroMaxDigitsNumberFormatter, inManagedObjectContext: viewContext) ?? ""
            let totalFat     = Nutrient.dispStringForNutrientWithKey("totalFat",     value: meal.doubleForKey("totalFat"),     formatter: zeroMaxDigitsNumberFormatter, inManagedObjectContext: viewContext) ?? ""
            let carbFructose = Nutrient.dispStringForNutrientWithKey("carbFructose", value: meal.doubleForKey("carbFructose"), formatter: zeroMaxDigitsNumberFormatter, inManagedObjectContext: viewContext) ?? ""
            let carbGlucose   = Nutrient.dispStringForNutrientWithKey("carbGlucose", value: meal.doubleForKey("carbGlucose"),  formatter: zeroMaxDigitsNumberFormatter, inManagedObjectContext: viewContext) ?? ""
            return totalEnergyCals + ", " + totalCarb + " KH, " + totalProtein + " Prot., " + totalFat + " Fett, " + carbFructose + " F, " + carbGlucose + " G"
        }
        return ""
    }

    
    func dateString(date: Date?) -> String {
        guard let date = date else { return "no date avaiable" }        
        return dateFormatter.string(from: date)
    }
}


//struct MealDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealDetailView()
//    }
//}
