//
//  ActivityValueView.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct ActivityValueView: View {
    @EnvironmentObject var manager: ActivityManager
    var body: some View {
        HStack {
            ForEach(manager.activities) { item in
                ValueItemView(item: item)
            }
        }
    }
}

struct ValueItemView: View {
    var item: ValueItem
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(item.selected ? Color.appGrediantTopLeadingToBottomTrailling : Color.appGrediantWhite)
                .frame(height: 130)
            
            VStack {
                Image(systemName: item.imageName)
                    .foregroundColor(item.selected ? Color.white : item.imageColor)
                    .rotationEffect(.degrees(item.imageRotation))
                    .padding(.bottom, 8)
                
                Text("\(item.value)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(item.selected ? Color.white : Color.black)
                
                Text("kCal")
                    .font(.system(size: 14))
                    .foregroundColor(item.selected ? Color.white : Color.black)
            }
        }
    }
}
