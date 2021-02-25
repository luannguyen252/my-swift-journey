//
//  RegisterTypeView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 03/12/2020.
//

import SwiftUI

struct RegisterTypeView: View {
  
  let gridColumns = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
    var body: some View {
        
      NavigationView {
        VStack{
          ScreenTitle("What are you looking for?")
          LazyVGrid(columns: gridColumns, alignment: .center, spacing: 24) {
            RegisterTypeCard(gradientStartColor: Color.roomStart,
                             gradientEndColor: Color.roomEnd,
                             image: "ic_room",
                             cardText: "Room")

            RegisterTypeCard(gradientStartColor: Color.placeStart,
                             gradientEndColor: Color.placeEnd,
                             image: "ic_entire_place",
                             cardText: "Entire Place")
            
            RegisterTypeCard(gradientStartColor: Color.roommateStart,
                             gradientEndColor: Color.roommateEnd,
                             image: "ic_roommate",
                             cardText: "Roommate")
            
            RegisterTypeCard(gradientStartColor: Color.tenantStart,
                             gradientEndColor: Color.tenantEnd,
                             image: "ic_tenant",
                             cardText: "Tenant")
          }
          .frame(maxWidth: .infinity)
          .padding()
          .navigationTitle("Step 1-4")
        }
        .frame(maxHeight: .infinity)
      }
      .navigationBarHidden(true)
    }
}

fileprivate struct RegisterTypeCard: View {
  @EnvironmentObject var onboardingDetails: UserOnboardingDetails
  @State private var navigate = false
  
  let gradientStartColor: Color
  let gradientEndColor: Color
  let image: String
  let cardText: String
  
  var body: some View {
    NavigationLink(destination: RegisterPlaceView(), isActive: $navigate) {
      Button(action: {
        onboardingDetails.roomType = cardText
        navigate = true
      } ) {
        ZStack {
          Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [gradientStartColor, gradientEndColor]),
                                 startPoint: .leading,
                                 endPoint: .bottom))
            .frame(width: 150, height: 150)
            .cornerRadius(6)
          Image(image)
            .resizable()
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .offset(y: -20)
          Text(cardText)
            .foregroundColor(.white)
            .bold()
            .offset(y: 35)
        }
        .shadow(radius: 10)
      }
    }
  }
}

struct RegisterTypeView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterTypeView()
          .environmentObject(UserOnboardingDetails())
    }
}
