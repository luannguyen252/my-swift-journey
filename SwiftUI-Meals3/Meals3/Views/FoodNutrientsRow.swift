//
//  FoodNutrientsView.swift
//  Meals3
//
//  Created by Uwe Petersen on 28.12.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI


fileprivate let numberFormatter: NumberFormatter =  {() -> NumberFormatter in
//    print("the one max digits")
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = NumberFormatter.Style.decimal
    numberFormatter.maximumFractionDigits = 1
    numberFormatter.roundingMode = NumberFormatter.RoundingMode.halfUp
    numberFormatter.zeroSymbol = "0"
    return numberFormatter
}()


/// Shows nutrient comrpehenstion data for a food.
///
/// Used in food search result list. Example data is
///
/// ` "Kuhmilch 3,5% Fett"`
///
/// `"65 kcal, 4,7 g KH, 3,4 g P, 3,6 g F, 0 g Fr., 0 g Gl."`

struct FoodNutrientsRow: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var food: Food
//    var formatter: NumberFormatter

    var body: some View {
        
        VStack(alignment: .leading) {
            Text(food.name ?? "")
            Text(food.nutrientStringForFood(formatter: numberFormatter))
                .font(.footnote)
        }
    }
}

struct FoodNutrientsView_Previews: PreviewProvider {
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
        
        return NavigationView {
            List {
                FoodNutrientsRow(food: food)
                    .environment(\.managedObjectContext, context)
                    .navigationBarTitle("Lebensmittelsuche")
            }
        }
    }
}
