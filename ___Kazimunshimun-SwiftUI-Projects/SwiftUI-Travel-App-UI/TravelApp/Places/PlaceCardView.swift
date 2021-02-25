//
//  PlaceCardView.swift
//  TravelApp
//
//  Created by Anik on 25/11/20.
//

import SwiftUI

struct PlaceCardView: View {
    let place: Place
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
                }
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.01)]),
                        startPoint: .bottom,
                        endPoint: .top)
                ) // so that text are easiar to read in front of white image
            }
            
            HStack {
                Image(systemName: "arrow.up.forward.square")
                    .foregroundColor(.gray)
                Text(place.departureDayLeft)
                Spacer()
                Circle()
                    .fill(Color.gray)
                    .frame(width: 40, height: 40)
            }
            .padding()
            .background(Color.white)
        }
        .cornerRadius(20)
    }
}
