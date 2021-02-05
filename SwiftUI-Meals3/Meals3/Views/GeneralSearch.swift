//
//  GeneralSearchView.swift
//  Meals3
//
//  Created by Uwe Petersen on 22.12.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI


struct GeneralSearch<T>: View where T: IngredientCollection  {
//struct GeneralSearchView: View  {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var ingredientCollection: T

    @ObservedObject var search = Search()

    var body: some View {
        
         VStack {
            SearchBarView(searchText: $search.text)
//                .resignKeyboardOnDragGesture()

            GeneralSearchResults(search: search, ingredientCollection: self.ingredientCollection)

            // Bottom tool bar
            GeneralSearchToolbar(search: search)
         }
         .onAppear() {
        }
    }
}

//struct GeneralSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//        return NavigationView {
//            return GeneralSearchView()
////                .environmentObject(Search())
//                .environment(\.managedObjectContext, viewContext)
//                .navigationBarTitle("General search")
//        }
//    }
//}
