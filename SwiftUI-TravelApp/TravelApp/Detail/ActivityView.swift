//
//  ActivityView.swift
//  TravelApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct ActivityView: View {
    // MARK: - PROPERTIES
    let activity: Activity

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                //: IMAGE WITH ACTIVITY TITLE
                Image(activity.imageName)
                    .resizable()
                    .frame(height: 200)
                
                HStack {
                    Text(activity.title)
                        .font(.system(size: 30, weight: .semibold))
                    Spacer()
                } //: HSTACK
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.01)]),
                        startPoint: .bottom,
                        endPoint: .top)
                )
            } //: ZSTACK
            
            VStack(alignment: .leading, spacing: 20) {
                //: ACTIVITY DETAIL
                InfoItemView(title: "ADDRESS", description: activity.address)
                
                HStack {
                    InfoItemView(title: "DURATION", description: activity.duration)
                    
                    Spacer()
                    
                    InfoItemView(title: "OCCUPANCY", description: activity.occupancy)
                    
                    Spacer()
                } //: HSTACK
                
                if activity.needBooking {
                    ActivityBookView(price: activity.price, previousPrice: activity.previousPrice)
                }
            } //: VSTACK
            .padding()
            .background(Color.white)
        } //: VSTACK
        .cornerRadius(15)
    }
}

// MARK: - ACTIVITY BOOK VIEW
struct ActivityBookView: View {
    // MARK: - PROPERTIES
    let price: String
    let previousPrice: String

    // MARK: - BODY
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading, spacing: 10) {
                Text("PRICE P/P")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray)
                Text(price)
                    .font(.system(size: 22, weight: .bold))
            } //: VSTACK
            
            Text(previousPrice)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.gray)
                .strikethrough(true, color: Color.black)
            
            Spacer()
            
            Button(action: { }, label: {
                Text("Book Now")
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(Color.orange)
                    .cornerRadius(5)
            })
        } //: HSTACK
    }
}
