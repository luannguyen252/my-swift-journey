//
//  DateDropDownView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct DateDropDownView: View {
    // MARK: - PROPERTIES
    let width: CGFloat
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
            .frame(width: width - 42, height: 60)
            .foregroundColor(.white)
            .shadow(color: Color(white: 0.92), radius: 6, x: 0, y: 3)
            
            HStack {
                Text(String("today, 24 dec").uppercased())
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .bold))
                Image("drop_down")
            } //: HSTACK
        } //: ZSTACK
        .offset(x: 0, y: -30)
    }
}
