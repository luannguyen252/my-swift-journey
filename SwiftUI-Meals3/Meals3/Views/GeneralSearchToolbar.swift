//
//  GeneralSearchToolbar.swift
//  Meals3
//
//  Created by Uwe Petersen on 04.01.20.
//  Copyright © 2020 Uwe Petersen. All rights reserved.
//

import SwiftUI

struct GeneralSearchToolbar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var search: Search
    
    @State private var showingSelection = false
    @State private var showingSortRules = false

    var body: some View {
        HStack {
            Button(action: { self.showingSelection.toggle() }) {
                Text(search.selection.rawValue)
                
            }
            .actionSheet(isPresented: $showingSelection) { selectionActionSheet() }

            Spacer()

            Button(action: { self.toggleSearchFilter() }) {
                Text(search.filter == SearchFilter.Contains ? "'   ...   '" : "'...      '").fontWeight(.bold)
            }

            Spacer()

            Button(action: { self.showingSortRules.toggle() }) {
                Text(search.sortRule.rawValue)
            }
            .actionSheet(isPresented: $showingSortRules) { sortRuleActionSheet() }
        }
        .padding()
    }
    
    func toggleSearchFilter() {
        search.filter = search.filter == .Contains ? .BeginsWith : .Contains
    }
    
    func sortRuleActionSheet() -> ActionSheet {
        ActionSheet(title: Text("Wonach soll sortiert werden?"), message: nil, buttons: [
            .default(Text(FoodListSortRule.NameAscending.rawValue)){ self.search.sortRule = .NameAscending },
            .default(Text(FoodListSortRule.TotalEnergyCalsDescending.rawValue)){ self.search.sortRule = .TotalEnergyCalsDescending },
            .default(Text(FoodListSortRule.TotalCarbDescending.rawValue)){ self.search.sortRule = .TotalCarbDescending },
            .default(Text(FoodListSortRule.TotalProteinDescending.rawValue)){ self.search.sortRule = .TotalProteinDescending },
            .default(Text(FoodListSortRule.TotalFatDescending.rawValue)){ self.search.sortRule = .TotalFatDescending },
            .default(Text(FoodListSortRule.FattyAcidCholesterolDescending.rawValue)){ self.search.sortRule = .FattyAcidCholesterolDescending },
            .default(Text(FoodListSortRule.GroupThenSubGroupThenNameAscending.rawValue)){ self.search.sortRule = .GroupThenSubGroupThenNameAscending },
            .cancel(Text("Zurück"))
            ]
        )
    }
    func selectionActionSheet() -> ActionSheet {
        ActionSheet(title: Text("Welche Lebensmittel sollen genutzt werden?"), message: nil, buttons: [
            .default(Text(FoodListSelection.Favorites.rawValue)){ self.search.selection = .Favorites },
            .default(Text(FoodListSelection.Recipes.rawValue)){ self.search.selection = .Recipes },
            .default(Text(FoodListSelection.LastWeek.rawValue)){ self.search.selection = .LastWeek },
            .default(Text(FoodListSelection.OwnEntries.rawValue)){ self.search.selection = .OwnEntries },
            .default(Text(FoodListSelection.MealIngredients.rawValue)){ self.search.selection = .MealIngredients },
            .default(Text(FoodListSelection.BLS.rawValue)){ self.search.selection = .BLS },
            .default(Text(FoodListSelection.All.rawValue)){ self.search.selection = .All },
            .cancel(Text("Zurück"))
            ]
        )
    }
}

struct GeneralSearchToolbar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                Spacer()
                GeneralSearchToolbar(search: Search())
            }
        }
        .navigationBarTitle("Lebensmittel")
    }
}
