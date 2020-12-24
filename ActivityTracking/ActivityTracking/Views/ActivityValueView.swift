//
//  ActivityValueView.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ActivityValueView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var manager: ActivityManager
    
    // MARK: - BODY
    var body: some View {
        HStack {
            ForEach(manager.activities) { item in
                ValueItemView(item: item)
            }
        } //: HSTACK
    }
}

// MARK: - VALUE ITEM
struct ValueItemView: View {
    // MARK: - PROPERTIES
    var item: ValueItem
    
    // MARK: - BODY
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
            } //: VSTACK
        } //: ZSTACK
    }
}
