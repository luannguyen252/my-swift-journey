//
//  NavigationViewPassingData.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct NavigationViewPassingData: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
           VStack(spacing: 32) {
               Text("You're going to flip a coin – do you want to choose heads or tails?")

               NavigationLink(destination: DetailView(choice: "Heads")) {
                   Text("Choose Heads")
               }

               NavigationLink(destination: DetailView(choice: "Tails")) {
                   Text("Choose Tails")
               }
           }
           .navigationBarTitle("Navigation")
       }
    }
}

// MARK: - PREVIEW
struct NavigationViewPassingData_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewPassingData()
    }
}
