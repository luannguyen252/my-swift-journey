//
//  FoodDetailToolbar.swift
//  Meals3
//
//  Created by Uwe Petersen on 22.12.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI

struct FoodDetailToolbar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var food: Food
    
    @State private var showingDeleteFoodConfirmationAlert = false
    @State private var showingCopyFoodConfirmationAlert = false

    var body: some View {
        HStack {

            Button(action: {
                self.copyFood()
                self.showingCopyFoodConfirmationAlert = true
            }) {
                Image(systemName: "doc.on.doc").padding(.horizontal)
            }
            
            Spacer()
            
            Button(action: {
                self.toggleFavoriteBookmark()
            }) {
                Image(systemName: food.favoriteListItem != nil ? "bookmark.fill" : "bookmark").padding(.horizontal)
            }
            
            Spacer()
            
            Button(action: {
                self.showingDeleteFoodConfirmationAlert = true
            }) {
                Image(systemName: "trash").padding(.horizontal)
            }
            .alert(isPresented: $showingDeleteFoodConfirmationAlert){ deleteFoodConfirmationAlert() }
        }
        .padding()
    }
    
    func copyFood() {
        let _ = Food.fromFood(self.food, inManagedObjectContext: self.viewContext)
        try? self.viewContext.save()
        self.presentationMode.wrappedValue.dismiss()
    }
        
    func deleteFoodConfirmationAlert() -> Alert {
        return Alert(title: Text("Lebensmittel löschen?"), message: Text(self.food.deletionConfirmation()),
//                     return Alert(title: Text("Lebensmittel löschen?"), message: confirmationText(),
                     primaryButton: .destructive(Text("Löschen")) {
                        self.deleteFood()
            },
                     secondaryButton: .cancel())
    }
    
//    func confirmationText() -> Text? {
//        if self.food.isMealAndRecipeIngredient() {
//            let uniqueMeals = Set(food.mealIngredients!.compactMap{ ($0 as AnyObject).meal })
//            let uniqueRecipes = Set (food.recipeIngredients!.compactMap{ ($0 as AnyObject).recipe })
//            return Text("Dieses Lebensmittel wird \(food.mealIngredients!.count) mal in insgesamt \(uniqueMeals.count) Mahlzeit(en) verwendet und wird aus diesen gelöscht.\n\nDieses Lebensmittel wird außerdem \(food.recipeIngredients!.count) mal in insgesamt \(uniqueRecipes.count) Rezept(en) verwendet und wird auch aus diesen gelöscht. ")
//        } else if self.food.isMealIngredient() {
//            let uniqueMeals = Set(food.mealIngredients!.compactMap{ ($0 as AnyObject).meal })
//            return Text("Dieses Lebensmittel wird \(food.mealIngredients!.count) mal in insgesamt \(uniqueMeals.count) Mahlzeit(en) verwendet und wird diesen gelöscht.")
//        } else if self.food.isRecipeIngredient() {
//            let uniqueRecipes = Set (food.recipeIngredients!.compactMap{ ($0 as AnyObject).recipe })
//            return Text("Dieses Lebensmittel wird \(food.recipeIngredients!.count) mal in insgesamt \(uniqueRecipes.count) Rezept(en) verwendet und wird diesen gelöscht.")
//        }
//        return Text("Dieses Lebensmitttel wird bisher in keiner Mahlzeit und keinem Rezept genutzt.")
//    }
        
    func deleteFood() {
        food.managedObjectContext?.delete(food)
        try? self.viewContext.save()
        self.showingDeleteFoodConfirmationAlert = false
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func toggleFavoriteBookmark() {
        if self.food.favoriteListItem != nil {
            self.food.favoriteListItem = nil
        } else {
            self.food.addToFavorites(managedObjectContext: self.viewContext)
        }
    }
}


struct FoodDetailViewToolbar_Previews: PreviewProvider {
    static var previews: some View {

        let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let food: Food = {
            let food = Food(context: viewContext)
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
            food.addToFavorites(managedObjectContext: viewContext)
            
            return food
        }()

        return NavigationView {
            return FoodDetailToolbar(food: food)
                .environment(\.managedObjectContext, viewContext)
                .navigationBarTitle(food.name ?? "Toolbar for FoodDetail")
        }
    }
}
