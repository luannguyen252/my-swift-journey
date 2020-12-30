//
//  AddPlantView.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 12.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Combine
import SwiftUI

struct AddPlantView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            Form {
                titleSection
            }
            // .navigationBarTitle("Add Plant", displayMode: .inline)
            .navigationBarTitle("Add Note", displayMode: .inline)
            .navigationBarItems(leading: leadingBarItem, trailing: trailingBarItem)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    private var titleSection: some View {
        Section() {
            TextField("Title", text: $viewModel.name)
        }
    }
    
    private var leadingBarItem: some View {
        Button(action: { self.presentationMode.wrappedValue.dismiss() }, label: {
            Text("Cancel")
        })
    }
    
    private var trailingBarItem: some View {
        Button(action: {
            self.viewModel.save()
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Save").disabled(!self.viewModel.canSave)
        })
    }
}

struct AddPPlantView_Previews: PreviewProvider {
    static let dependencyContainer: DependencyContainer = {
        let container = DependencyContainer()
        container.loadDependencies {}
        return container
    }()
    
    static var previews: some View {
        AddPlantView(viewModel: AddPlantView.ViewModel(managedObjectContext: dependencyContainer.persistentContainer.viewContext))
    }
}
