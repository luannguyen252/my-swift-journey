//
//  RecipeDetailToolbar.swift
//  Meals3
//
//  Created by Uwe Petersen on 05.01.20.
//  Copyright © 2020 Uwe Petersen. All rights reserved.
//

import SwiftUI

struct RecipeDetailToolbar: View {
    @ObservedObject var recipe: Recipe
    
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @EnvironmentObject var currentMeal: CurrentMeal

    @State private var isShowingGeneralSearchView = false
    @State private var isShowingDeleteAlert = false
    
    var body: some View {
        HStack {
            Button(action: { withAnimation{ self.copyRecipe() } },
                   label: { Image(systemName: "doc.on.doc").padding(.horizontal)
            })

            Spacer()
            
            Button(action: { withAnimation{self.isShowingGeneralSearchView = true} },
                   label: { Image(systemName: "magnifyingglass").padding(.horizontal)
            })

            Spacer()
            
            Button(action: { withAnimation {self.isShowingDeleteAlert = true} },
                   label: { Image(systemName: "trash").padding(.horizontal)
            })
                .alert(isPresented: $isShowingDeleteAlert){ self.deleteAlert() }

            
            // Zero size (thus invisible) NavigationLink with EmptyView() to move to
            NavigationLink(destination: GeneralSearch(ingredientCollection: self.recipe).environment(\.managedObjectContext, viewContext),
                           isActive: $isShowingGeneralSearchView,
                           label: {EmptyView()})
                .frame(width: 0, height: 0)
        }
        .padding()
    }

    func copyRecipe() {
        
    }
    
    func deleteAlert() -> Alert {
        print("delete the Recipe with confirmation")
        return Alert(title: Text("Rezept wirklich löschen?"), message: Text(self.recipe.food?.deletionConfirmation() ?? ""),
              primaryButton: .destructive(Text("Delete")) {
                self.presentationMode.wrappedValue.dismiss()
                self.viewContext.delete(self.recipe)
                try? self.viewContext.save()
            },
              secondaryButton: .cancel())
    }
}

//struct RecipeDetailToolbar_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeDetailToolbar()
//    }
//}
