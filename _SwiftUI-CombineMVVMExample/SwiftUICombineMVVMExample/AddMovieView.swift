//
//  AddMovieView.swift
//  SwiftUICombineMVVMExample
//
//  Created by Toomas Vahter on 03.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Combine
import SwiftUI

struct AddMovieView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            Form {
                titleSection
                ratingSection
            }.navigationBarTitle("Add Movie", displayMode: .inline)
                .navigationBarItems(leading: leadingBarItem, trailing: trailingBarItem)
                .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
    
    private var titleSection: some View {
        Section() {
            TextField("Title", text: viewModel.title)
        }
    }

    private var ratingSection: some View {
        Section() {
            Picker(LocalizedStringKey("Rating"), selection: viewModel.rating) {
                ForEach(Movie.Rating.allCases, id: \.rawValue) {
                    Text($0.localizedName).tag($0)
                }
            }
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

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView(viewModel: AddMovieView.ViewModel(movieStore: MovieStore()))
    }
}
