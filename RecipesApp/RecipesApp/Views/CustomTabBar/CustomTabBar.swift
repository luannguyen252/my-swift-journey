//
//  CustomTabBar.swift
//  RecipesApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CustomTabBar: View {
    // MARK: - PROPERTIES
    @Binding var selectedTab: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            //: HOME
            TabButton(title: "Home", selectedTab: $selectedTab)
            
            Spacer(minLength: 0)
            
            //: CALL TO ACTION
            Button(action: {
                print("Button Pressed!")
            }) {
                Image("plus")
                    .renderingMode(.original)
                    .padding(.vertical)
                    .padding(.horizontal,25)
                    .background(Color("orange"))
                    .cornerRadius(15)
            }
            
            Spacer(minLength: 0)
            
            //: SAVED
            TabButton(title: "Saved", selectedTab: $selectedTab)
        } //: HSTACK
        .padding(.top)
        .padding(.horizontal,22)
        .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        .background(Color.white)
        .clipShape(CustomCorner(corners: [.topLeft,.topRight], size: 55))
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -5)
    }
}
