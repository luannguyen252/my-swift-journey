//
//  TodayDataView.swift
//  CaloryApp
//
//  Created by Anik on 29/6/20.
//  Copyright © 2020 a7studio. All rights reserved.
//

import SwiftUI

struct TodayDataView: View {
    let width: CGFloat
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                InfoView()
                GraphInfoView(width: width)
            }
            //Text("Today Data View View")
        }
        .background(ColorConstants.todayViewGradientColor)
        .cornerRadius(40)
    }
}

struct TodayDataView_Previews: PreviewProvider {
    static var previews: some View {
        TodayDataView(width: 375)
    }
}
