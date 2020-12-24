//
//  AddDataView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct AddDataView: View {
    // MARK: - PROPERTIES
    let width: CGFloat
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(ColorConstants.todayViewGradientColor)
                .frame(height: 140)
            
            DateDropDownView(width: width)
            
            CaloryIntakeView()
        } //: VSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct AddDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddDataView(width: 375)
    }
}
#endif
