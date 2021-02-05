//
//  FoodDetailToolbar.swift
//  Meals3
//
//  Created by Uwe Petersen on 22.12.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI

struct FoodDetailToolbar<T>: View where T: IngredientCollection{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext

    @ObservedObject var food: Food
    @ObservedObject var ingredientCollection: T
    @Binding var showingAddOrChangeAmountOfFoodView: Bool
    
    @State private var showingCopyFoodConfirmationAlert = false
//    @State private var showingAddOrChangeAmountOfFoodView = false


    var body: some View {
        HStack {
            
            Button(action: {
                self.copyFood()
                self.showingCopyFoodConfirmationAlert = true
            }) {
                Image(systemName: "doc.on.doc").padding()
            }
            
            Spacer()
            
            Button(action: {
                self.toggleFavoriteBookmark()
            }) {
                Image(systemName: food.favoriteListItem != nil ? "bookmark.fill" : "bookmark").padding()
            }
            
            Spacer()
            
            Button(action: {
                print("Plus button was tapped")
                self.showingAddOrChangeAmountOfFoodView = true
            }) { Image(systemName: "plus").padding() }
        }
    }
    
    func copyFood() {
        let _ = Food.fromFood(food, inManagedObjectContext: viewContext)
        try? viewContext.save()
        presentationMode.wrappedValue.dismiss()
    }
        
    func toggleFavoriteBookmark() {
        if food.favoriteListItem != nil {
            food.favoriteListItem = nil
        } else {
            food.addToFavorites(managedObjectContext: viewContext)
        }
    }
}



//struct FoodDetailToolbar<T>: View where T: IngredientCollection{
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @Environment(\.managedObjectContext) var viewContext
//
//    @ObservedObject var food: Food
//    @ObservedObject var ingredientCollection: T
//
//    @State private var showingCopyFoodConfirmationAlert = false
//    @State private var showingAddOrChangeAmountOfFoodView = false
//
//
//    var body: some View {
//        HStack {
//
//            Button(action: {
//                self.copyFood()
//                self.showingCopyFoodConfirmationAlert = true
//            }) {
//                Image(systemName: "doc.on.doc").padding()
//            }
//
//            Spacer()
//
//            Button(action: {
//                self.toggleFavoriteBookmark()
//            }) {
//                Image(systemName: food.favoriteListItem != nil ? "bookmark.fill" : "bookmark").padding()
//            }
//
//            Spacer()
//
//            Button(action: {
//                print("Plus button was tapped")
//                self.showingAddOrChangeAmountOfFoodView = true
//            }) { Image(systemName: "plus").padding() }
//                .sheet(isPresented: $showingAddOrChangeAmountOfFoodView,
//                       content:{ AddOrChangeAmountOfFoodView(food: self.food,
//                                                             task: .addAmountOfFoodToIngredientCollection(self.ingredientCollection),
//                                                             isPresented: self.$showingAddOrChangeAmountOfFoodView,
//                                                             presentationModeOfParentView: self.presentationMode)
//                        .environment(\.managedObjectContext, self.viewContext)}
//            )
//        }
//    }
//
//    func copyFood() {
//        let _ = Food.fromFood(food, inManagedObjectContext: viewContext)
//        try? viewContext.save()
//        presentationMode.wrappedValue.dismiss()
//    }
//
//    func toggleFavoriteBookmark() {
//        if food.favoriteListItem != nil {
//            food.favoriteListItem = nil
//        } else {
//            food.addToFavorites(managedObjectContext: viewContext)
//        }
//    }
//}


//
//struct FoodDetailViewToolbar_Previews: PreviewProvider {
//    static var previews: some View {
//
//        let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let food: Food = {
//            let food = Food(context: viewContext)
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
//            food.addToFavorites(managedObjectContext: viewContext)
//            
//            return food
//        }()
//
//        return NavigationView {
//            return FoodDetailToolbar(food: food)
//                .environment(\.managedObjectContext, viewContext)
//                .navigationBarTitle(food.name ?? "Toolbar for FoodDetail")
//        }
//    }
//}
