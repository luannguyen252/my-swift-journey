//
//  CaloryGraphView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CaloryGraphView: View {
    // MARK: - PROPERTIES
    let graphViewModel: CaloryDataViewModel
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .bottom, spacing: 14) {
            ForEach (self.graphViewModel.data, id: \.self) { dayData in
                DataItemView(data: dayData)
            }
        } //: HSTACK
    }
}
