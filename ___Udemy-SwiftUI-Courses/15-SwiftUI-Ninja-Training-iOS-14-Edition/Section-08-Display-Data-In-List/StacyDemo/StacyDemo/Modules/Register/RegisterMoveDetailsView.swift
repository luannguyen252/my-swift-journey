//
//  RegisterMoveDetailsView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 11/12/2020.
//

import SwiftUI

struct RegisterMoveDetailsView: View {
  @EnvironmentObject var onboardingDetails: UserOnboardingDetails
  
    var body: some View {
      VStack {
        RentDetails()
          .padding(.top, 40)
        Spacer()
        NavigationLink(destination: RegisterProfileView()) {
          Text("NEXT")
            .textStyle(GradientButtonStyle())
            .padding(.bottom, 20)
        }
      }
      .navigationTitle("Step 3-4")
    }
}

struct RegisterMoveDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterMoveDetailsView()
          .environmentObject(UserOnboardingDetails())
    }
}

fileprivate struct RentDetails: View {
  @EnvironmentObject var onboardingDetails: UserOnboardingDetails
  
  var body: some View {
    VStack(alignment: .leading) {
      ScreenTitle("What is your maximum rent?")
      
      HStack(alignment: .bottom) {
        Text(String(format: "$%.0f", onboardingDetails.maxRent))
          .foregroundColor(.blue)
          .bold()
          .font(.title)
        Text("per month")
          .padding(.bottom, 6)
      }
      .padding(.leading, 20)
      
      VStack {
        Slider(value: $onboardingDetails.maxRent, in: 0...5000, step: 100)
        HStack {
          Text("$0")
            .foregroundColor(.text)
          Spacer()
          Text("$5000")
            .foregroundColor(.text)
        }
      }
      .padding(.horizontal, 20)
      .padding(.bottom, 40)
      
      ScreenTitle("When is your move-in date?")
      DatePicker(selection: $onboardingDetails.moveInDate,
                 displayedComponents: .date,
                 label: { Text("Move-in Date") })
        .padding(.horizontal, 20)
    }
  }
}
