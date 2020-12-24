//
//  GraphInfoView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct GraphInfoView: View {
    // MARK: - PROPERTIES
    let width: CGFloat
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            WaveView()
                .frame(width: 194, height: 194)
            
            NumberDataView(name: "kcal left", value: "3,456", isGramPresent: false, nameFontSize: 15, valueFontSize: 54)
            
            Spacer()
            
            CaloryGraphView(graphViewModel: CaloryDataViewModel())
            
            Spacer()
        } //: VSTACK
        .frame(width: width - width / 2.5)
        .background(ColorConstants.todayViewGradientColor)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct GraphInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GraphInfoView(width: 340)
    }
}
#endif
