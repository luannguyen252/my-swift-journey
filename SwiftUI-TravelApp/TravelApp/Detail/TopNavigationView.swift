//
//  TopNavigationView.swift
//  TravelApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct TopNavigationView: View {
    // MARK: - PROPERTIES
    @ObservedObject var placeFinder: PlaceFinder
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                withAnimation { placeFinder.selectedPlace = nil }
            }, label: {
                Image(systemName: "arrow.left")
                    .padding()
                    .foregroundColor(.black)

            })
            
            Spacer()
            
            Text(placeFinder.selectedPlace?.name ?? "")
                .font(.system(size: 20, weight: .bold))
            
            Spacer()
            
            Image(systemName: "paperplane")
                .padding()
        } //: HSTACK
    }
}
