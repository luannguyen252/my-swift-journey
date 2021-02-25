//
//  FlightView.swift
//  TravelApp
//
//  Created by Anik on 25/11/20.
//

import SwiftUI

struct FlightView: View {
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
                }
                
                HStack {
                    InfoItemView(title: "FLIGHT", description: "BE2356")
                    
                    Spacer()
                    
                    InfoItemView(title: "BOARDING", description: "14:30")
                    
                    Spacer()
                    
                    Text("KTM")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .black))
                }
            }
            .padding(20)
        }
    }
}

struct FlightItemView: View {
    let airport: String
    let shortAirport: String
    let time: String
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
        }
    }
}
