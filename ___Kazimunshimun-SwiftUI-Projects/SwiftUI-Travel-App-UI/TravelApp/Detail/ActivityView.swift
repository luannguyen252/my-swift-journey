//
//  ActivityView.swift
//  TravelApp
//
//  Created by Anik on 25/11/20.
//

import SwiftUI

struct ActivityView: View {
    let activity: Activity
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                // image with activity title
                Image(activity.imageName)
                    .resizable()
                    .frame(height: 200)
                
                HStack {
                    Text(activity.title)
                        .font(.system(size: 30, weight: .semibold))
                    Spacer()
                }
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.01)]),
                        startPoint: .bottom,
                        endPoint: .top)
                )
            }
            
            VStack(alignment: .leading, spacing: 20) {
                // activity detail
                InfoItemView(title: "ADDRESS", description: activity.address)
                
                HStack {
                    InfoItemView(title: "DURATION", description: activity.duration)
                    
                    Spacer()
                    
                    InfoItemView(title: "OCCUPANCY", description: activity.occupancy)
                    
                    Spacer()
                }
                
                if activity.needBooking {
                    // book view
                    ActivityBookView(price: activity.price, previousPrice: activity.previousPrice)
                }
            }
            .padding()
            .background(Color.white)
            
        }
        .cornerRadius(15)
    }
}

struct ActivityBookView: View {
    let price: String
    let previousPrice: String
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading, spacing: 10) {
                Text("PRICE P/P")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray)
                Text(price)
                    .font(.system(size: 22, weight: .bold))
            }
            
            Text(previousPrice)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.gray)
                .strikethrough(true, color: Color.black)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Book Now")
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(Color.orange)
                    .cornerRadius(5)
            })
        }
    }
}
