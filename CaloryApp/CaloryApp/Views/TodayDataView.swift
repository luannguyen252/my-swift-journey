//
//  TodayDataView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TodayDataView: View {
    // MARK: - PROPERTIES
    let width: CGFloat
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                InfoView()
                GraphInfoView(width: width)
            } //: HSTACK
        } //: ZSTACK
        .background(ColorConstants.todayViewGradientColor)
        .cornerRadius(40)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct TodayDataView_Previews: PreviewProvider {
    static var previews: some View {
        TodayDataView(width: 375)
    }
}
#endif
