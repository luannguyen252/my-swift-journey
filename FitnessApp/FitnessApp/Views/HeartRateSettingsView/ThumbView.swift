//
//  ThumbView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ThumbView: View {
    // MARK: - PROPERTIES
    let width: CGFloat
    let spacing: CGFloat
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: spacing) {
            Rectangle()
                .frame(width: width, height: 1)
            
            Rectangle()
                .frame(width: width, height: 1)
        } //: VSTACK
    }
}
