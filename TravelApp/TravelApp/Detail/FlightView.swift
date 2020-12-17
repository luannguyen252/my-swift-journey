//
//  FlightView.swift
//  TravelApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct FlightView: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(height: 220)
            
            VStack(spacing: 40) {
                HStack(spacing: 24) {
                    FlightItemView(airport: "BRATISLAVA", shortAirport: "BTS", time: "15:00")
                    
                    HStack {
                        Image(systemName: "airplane")
                        
                        Image(systemName: "ellipsis")
                    }
                    
                    FlightItemView(airport: "ESMERALDS", shortAirport: "ESM", time: "08:00")
                    
                    Spacer()
                } //: HSTACK
                
                HStack {
                    InfoItemView(title: "FLIGHT", description: "BE2356")
                    
                    Spacer()
                    
                    InfoItemView(title: "BOARDING", description: "14:30")
                    
                    Spacer()
                    
                    Text("KTM")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .black))
                } //: HSTACK
            } //: VSTACK
            .padding(20)
        } //: ZSTACK
    }
}

// MARK: - FLIGHT ITEM VIEW
struct FlightItemView: View {
    // MARK: - PROPERTIES
    let airport: String
    let shortAirport: String
    let time: String

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text(airport)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.gray)
            
            Text(shortAirport)
                .font(.system(size: 32, weight: .bold))
            
            Text(time)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
                .padding(5)
                .background(Color.orange)
                .cornerRadius(4)
        } //: VSTACK
    }
}
