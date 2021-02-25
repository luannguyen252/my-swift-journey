//
//  InfoDashboardView.swift
//  StepCounter
//
//  Created by Anik on 18/8/20.
//

import SwiftUI

struct InfoDashboardView: View {
    @EnvironmentObject var manager: StepCountManager
    var body: some View {
        HStack {
            DataItemView(dataItem: manager.statData[0])
            
            Spacer()
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 1, height: 200)
                .opacity(0.2)
            
            Spacer()
            
            DataItemView(dataItem: manager.statData[1])
            
            Spacer()
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 1, height: 200)
                .opacity(0.2)
            
            Spacer()
            
            DataItemView(dataItem: manager.statData[2])
        }
    }
}

struct DataItemView: View {
    let dataItem: DataItem
    var body: some View {
        VStack {
            Image(systemName: dataItem.imageName)
                .foregroundColor(dataItem.imageColor)
                .font(.system(size: 48))
                .shadow(color: dataItem.imageColor.opacity(0.5), radius: 10, x: 4, y: 24)
            
            Text(dataItem.value)
                .font(.system(size: 36, design: .monospaced))
                .fixedSize()
                .frame(width: 60)
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            Text(dataItem.unit)
                .font(.system(size: 22))
        }
        .foregroundColor(.white)
    }
}
