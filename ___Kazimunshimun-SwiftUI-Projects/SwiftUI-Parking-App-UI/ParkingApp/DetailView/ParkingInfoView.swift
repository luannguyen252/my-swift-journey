//
//  ParkingInfoView.swift
//  ParkingApp
//
//  Created by Anik on 2/12/20.
//

import SwiftUI

struct ParkingInfoView: View {
    let parkingItem: ParkingItem
    @Binding var showSelectHourView: Bool
    @Binding var selectedHour: CGFloat
    var body: some View {
        VStack(spacing: 16) {
            Text(parkingItem.name)
                .font(.system(size: 30, weight: .bold))
            
            Text(parkingItem.address)
                .font(.system(size: 16))
                .foregroundColor(.gray)
            
            HStack {
                Image(systemName: "car.fill")
                    .foregroundColor(.gray)
                Text("\(parkingItem.carLimit)")
                    .foregroundColor(.gray)
                    .padding(.trailing, 16)
                
                
                Image(systemName: "dollarsign.circle.fill")
                    .foregroundColor(.gray)
                Text("$\(String.init(format: "%0.2f", parkingItem.fee))/h")
                    .foregroundColor(.gray)
            }
            .font(.system(size: 16))
            
            HStack(spacing: 10) {
                InfoItemView(imageName: "place", value: parkingItem.place, title: "Parking Place")
                
                InfoItemView(imageName: "cost", value: getHour(), title: "Time")
                    .onTapGesture {
                        withAnimation {
                            showSelectHourView = true
                        }
                    }
            }
        }
    }
    
    func getHour() -> String {
        let hourSeparated = modf(selectedHour/2)
        let hourData = String.init(format: "%0.0f", hourSeparated.0)
        let minuteData = hourSeparated.1 == 0.0 ? "0" : "30"
        
        return "\(hourData) h \(minuteData) m"
    }
}

