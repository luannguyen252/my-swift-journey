//
//  RecipeIngredientRow.swift
//  Meals3
//
//  Created by Uwe Petersen on 05.01.20.
//  Copyright © 2020 Uwe Petersen. All rights reserved.
//

import SwiftUI

fileprivate let formatter = NumberFormatter()

struct RecipeIngredientRow: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var ingredient: RecipeIngredient

    @State private var task: Task?
    @State private var showingAddOrChangeAmountOfFoodView = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode> // This is a dummy, unfortunately I do not know a better way

    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(ingredient.food?.name ?? "-")
                    .lineLimit(1)
                Spacer()
                Text("\(ingredient.amount ?? NSNumber(-999), formatter: NumberFormatter()) g")
                    .foregroundColor(Color(.systemBlue))
                    .onTapGesture {
                        print("tapped")
                        self.task = .changeAmountOfIngredient(self.ingredient as Ingredient)
                        self.showingAddOrChangeAmountOfFoodView = true
                }
            }
            Text(self.contentFor(ingredient: ingredient))
                .lineLimit(1)
                .font(.footnote)
        }
            // TODO: hier geht's weiter: optionals rausmachen
        .sheet(isPresented: $showingAddOrChangeAmountOfFoodView, content:{
             AddOrChangeAmountOfIngredientView(food: self.ingredient.food!,
                                         task: self.task!,
                                         isPresented: self.$showingAddOrChangeAmountOfFoodView, presentationModeOfParentView: self.presentationMode)
                .environment(\.managedObjectContext, self.viewContext)
        })
    }
    
    func stringForNumber (_ number: NSNumber, formatter: NumberFormatter, divisor: Double) -> String {
        return (formatter.string(from: NSNumber(value: number.doubleValue / divisor)) ?? "nan")
    }
    
    func contentFor(ingredient: RecipeIngredient) -> String {
        // Returns a String like "44 kcal, 10 g, KH, ..."
        
        let totalEnergyCals = Nutrient.dispStringForNutrientWithKey("totalEnergyCals", value: ingredient.doubleForKey("totalEnergyCals"), formatter: formatter, inManagedObjectContext: viewContext) ?? ""
        let totalCarb    = Nutrient.dispStringForNutrientWithKey("totalCarb",    value: ingredient.doubleForKey("totalCarb"),    formatter: formatter, inManagedObjectContext: viewContext) ?? ""
        let totalProtein = Nutrient.dispStringForNutrientWithKey("totalProtein", value: ingredient.doubleForKey("totalProtein"), formatter: formatter, inManagedObjectContext: viewContext) ?? ""
        let totalFat     = Nutrient.dispStringForNutrientWithKey("totalFat",     value: ingredient.doubleForKey("totalFat"),     formatter: formatter, inManagedObjectContext: viewContext) ?? ""
        let carbFructose = Nutrient.dispStringForNutrientWithKey("carbFructose", value: ingredient.doubleForKey("carbFructose"), formatter: formatter, inManagedObjectContext: viewContext) ?? ""
        let carbGlucose  = Nutrient.dispStringForNutrientWithKey("carbGlucose", value: ingredient.doubleForKey("carbGlucose"),  formatter: formatter, inManagedObjectContext: viewContext) ?? ""
        
        return totalEnergyCals + ", " + totalCarb + " KH, " + totalProtein + " Prot., " + totalFat + " Fett, " + carbFructose + " Fruct., " + carbGlucose + " Gluc."
    }
}

//struct RecipeIngredientRow_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeIngredientRow()
//    }
//}
