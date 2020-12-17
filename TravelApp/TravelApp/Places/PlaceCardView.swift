//
//  PlaceCardView.swift
//  TravelApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct PlaceCardView: View {
    // MARK: - PROPERTIES
    let place: Place

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                Image(place.imageName)
                    .resizable()
                    .frame(height: 300)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.system(size: 44, weight: .bold))
                    
                    HStack {
                        Text(place.date)
                        Spacer()
                    }
                } //: VSTACK
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.01)]),
                        startPoint: .bottom,
                        endPoint: .top)
                ) //: SO THAT TEXT ARE EASIER TO READ IN FRONT OF WHITE IMAGE
            } //: ZSTACK
            
            HStack {
                Image(systemName: "arrow.up.forward.square")
                    .foregroundColor(.gray)
                Text(place.departureDayLeft)
                Spacer()
                Circle()
                    .fill(Color.gray)
                    .frame(width: 40, height: 40)
            } //: HSTACK
            .padding()
            .background(Color.white)
        } //: VSTACK
        .cornerRadius(20)
    }
}
