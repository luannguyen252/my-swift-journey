//
//  MealDetailIngredientsView.swift
//  Meals3
//
//  Created by Uwe Petersen on 30.12.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI


struct MealDetailIngredients: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var meal: Meal
    
    var body: some View {
        List {
            if meal.filteredAndSortedMealIngredients() == nil {
                Text("Leere Mahlzeit").foregroundColor(Color(.placeholderText))
            } else {
                ForEach(meal.filteredAndSortedMealIngredients()!) { (mealIngredient: MealIngredient) in
                    MealIngredientCellView(mealIngredient: mealIngredient)
                }
                .onDelete() {
                    self.deleteMealIngredients(indexSet: $0)
                }
            }
        }
    }

    func deleteMealIngredients (indexSet: IndexSet) -> () {
        print("Deleting meal ingredient from food.")
        for index in indexSet {
            viewContext.delete(self.meal.filteredAndSortedMealIngredients()![index])
        }
        HealthManager.synchronize(self.meal, withSynchronisationMode: .update)
        try? viewContext.save()
    }
}

//struct MealDetailIngredientsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealDetailIngredientsView()
//    }
//}
