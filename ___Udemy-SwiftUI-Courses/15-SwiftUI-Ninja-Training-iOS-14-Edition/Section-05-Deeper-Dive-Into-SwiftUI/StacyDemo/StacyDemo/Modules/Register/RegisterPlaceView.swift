//
//  RegisterPlaceView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 10/12/2020.
//

import SwiftUI

struct RegisterPlaceView: View {
  
  
  let gridColumns = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
    var body: some View {
      VStack {
        ScreenTitle("Where are you going?")
        
        LazyVGrid(columns: gridColumns, alignment: .center, spacing: 20) {
          RegisterLocationCard(image: "img_london", city: "London", country: "UK")
          
          RegisterLocationCard(image: "img_paris", city: "Paris", country: "France")
          
          RegisterLocationCard(image: "img_newyork", city: "New York", country: "USA")
          
          RegisterLocationCard(image: "img_boston", city: "Bostong", country: "USA")
        }
      }
      .navigationTitle("Step 2-4")
    }
}

fileprivate struct RegisterLocationCard: View {
  
  @EnvironmentObject var onboardingDetails: UserOnboardingDetails
  @State private var navigate = false
  
  let image: String
  let city: String
  let country: String
  
  var body: some View {
    NavigationLink(destination: RegisterMoveDetailsView(), isActive: $navigate) {
      Button(action: {
        onboardingDetails.location = city
        navigate.toggle()
      }) {
        VStack(alignment: .leading) {
          Image(image)
          Text(city)
            .foregroundColor(.title)
            .bold()
          Text(country)
            .font(.system(size: 14))
            .foregroundColor(.text)
        }
      }
    }
  }
}

struct RegisterPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlaceView()
          .environmentObject(UserOnboardingDetails())
    }
}
