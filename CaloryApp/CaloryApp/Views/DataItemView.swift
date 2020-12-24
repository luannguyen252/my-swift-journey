//
//  DataItemView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct DataItemView: View {
    // MARK: - PROPERTIES
    let data: CaloryData
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 9, height: data.value)
            Text(data.dayOfWeek)
                .foregroundColor(.white)
                .font(.system(size: 10))
        } //: VSTACK
    }
}
